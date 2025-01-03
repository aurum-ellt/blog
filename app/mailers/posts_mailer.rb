class PostsMailer < ApplicationMailer
  after_deliver :mark_post_as_broadcasted

  def broadcast(post)
    @post = post
    mail subject: post.title, from: email_address_with_name("from@example.com", post.user.name), to: post.user.subscribers.pluck(:email_address)
  end

  private
    def mark_post_as_broadcasted
      @post.touch(:broadcasted_at)
    end
end
