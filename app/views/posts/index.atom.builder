atom_feed do |feed|
  feed.title @posts.first.user.name
  feed.updated @posts.maximum(:updated_at)

  @posts.each do |post|
    feed.entry post do |entry|
      entry.title post.title
      entry.content post.body, type: :html

      entry.author do |author|
        author.name post.user.name
      end
    end
  end
end
