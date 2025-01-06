class Posts::DraftsController < ApplicationController
  def index
    @posts = Current.user.posts.draft.order(updated_at: :desc)
  end
end
