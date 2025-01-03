class Posts::BroadcastsController < ApplicationController
  def create
    post = Post.find(params.expect(:post_id))
    return head :forbidden unless post.published?

    PostsMailer.broadcast(post).deliver_later
    redirect_to author_post_path(post.user.slug, post.slug), notice: "Post was successfully broadcasted."
  end
end
