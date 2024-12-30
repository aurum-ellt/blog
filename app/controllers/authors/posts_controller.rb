class Authors::PostsController < ApplicationController
  allow_unauthenticated_access
  before_action :set_author, only: %i[ index show ]

  def index
    @posts = @author.posts.published
  end

  def show
    @post = Post.find_by(slug: params.expect(:slug))
  end

  private
    def set_author
      @author = User.find_by(slug: params.expect(:author_slug))
    end
end
