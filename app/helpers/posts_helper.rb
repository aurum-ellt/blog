module PostsHelper
  def blog_post_life_cycle_options(post)
    case post.status.to_sym
    when :draft
      button_to "Publish this post", post, method: :patch, params: { post: { status: :published } }, class: "block text-base text-gray-600 font-normal hover:text-gray-900"
    when :published
      button_to("Broadcast this post", post_broadcasts_path(post), method: :post, class: "block text-base text-gray-600 font-normal hover:text-gray-900") +
      button_to("Archive this post", post, method: :patch, params: { post: { status: :archived } }, class: "block text-base text-gray-600 font-normal hover:text-gray-900")
    when :archived
      button_to "Destroy this post", post, method: :delete, class: "block text-base text-gray-600 font-normal hover:text-gray-900"
    end
  end
end
