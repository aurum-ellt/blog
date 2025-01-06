class Posts::ArchivesController < ApplicationController
  def index
    @posts = Current.user.posts.archived.order(published_at: :desc)
  end
end
