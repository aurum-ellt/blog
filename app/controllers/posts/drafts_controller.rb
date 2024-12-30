class Posts::DraftsController < ApplicationController
  def index
    @posts = Current.user.posts.draft
  end
end
