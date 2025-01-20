class PostsMailer < ApplicationMailer
  after_deliver :mark_post_as_broadcasted

  def broadcast(post)
    @post = post

    post.user.subscribers.each do |subscriber|
      @subscriber_token = subscriber.token
      mail subject: post.title, from: email_address_with_name("from@example.com", post.user.name), to: subscriber.email_address
    end
  end

  private
    def mark_post_as_broadcasted
      @post.touch(:broadcasted_at)
    end
end
