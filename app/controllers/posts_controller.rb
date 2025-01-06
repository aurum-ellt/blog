class PostsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_author, only: %i[ index show ]
  before_action :set_post, only: %i[ edit update destroy ]
  before_action -> { ensure_permissions_for @post }, only: %i[ edit update destroy ]

  def index
    @posts = @author.posts.published.order(published_at: :desc)
  end

  def show
    @post = @author.posts.find_by!(slug: params.expect(:slug))
    head :forbidden unless @post.published? || (authenticated? && @post.user == Current.user)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to author_post_path(@post.user.slug, @post.slug), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to author_post_path(@post.user.slug, @post.slug), notice: "Post was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, notice: "Post was successfully destroyed.", status: :see_other
  end

  private
    def set_author
      @author = User.find_by!(slug: params.expect(:author_slug))
    end

    def set_post
      @post = Post.find(params.expect(:id))
    end

    def post_params
      params.expect(post: [ :title, :body, :status ])
    end
end
