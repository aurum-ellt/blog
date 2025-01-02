class SubscribersController < ApplicationController
  allow_unauthenticated_access
  before_action :set_subscriber, only: %i[ confirmed unsubscribe ]

  def create
    author = User.find_by(slug: params.expect(:author_slug))

    if subscriber = author.subscribers.create(subscriber_params)
      SubscribersMailer.confirm(subscriber, author).deliver_later
      flash[:notice] = "Subscriber was successfully created."
    else
      flash[:alert] = "Sorry, something went wrong."
    end

    redirect_back_or_to root_path
  end

  def confirmed
    @subscriber.update!(confirmed: true)
  end

  def unsubscribe
    @subscriber.destroy!
  end

  private
    def set_subscriber
      @subscriber = Subscriber.find_by(token: params.expect(:subscriber_token))
    end

    def subscriber_params
      params.expect(subscriber: [ :email_address ])
    end
end
