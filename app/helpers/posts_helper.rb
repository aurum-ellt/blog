module PostsHelper
  def blog_post_life_cycle_options(post)
    case post.status.to_sym
    when :draft
      button_to "Publish this post", post, method: :patch, params: { post: { status: :published } }, class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium"
    when :published
      button_to "Archive this post", post, method: :patch, params: { post: { status: :archived } }, class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium"
    when :archived
      button_to "Destroy this post", post, method: :delete, class: "mt-2 rounded-lg py-3 px-5 bg-gray-100 font-medium"
    end
  end
end
