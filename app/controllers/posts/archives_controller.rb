class Posts::ArchivesController < ApplicationController
  def index
    @posts = Current.user.posts.archived
  end
end
