module PostsHelper
  def blog_post_life_cycle_options(post)
    options = ""

    if post.draft? || post.archived?
      options += button_to("Publish this post", post, method: :patch, params: { post: { status: :published } }, class: "block text-base text-gray-600 font-normal hover:text-gray-900")
      options += button_to("Destroy this post", post, method: :delete, class: "block text-base text-gray-600 font-normal hover:text-gray-900")
    end

    if post.published?
      options += button_to("Broadcast this post", post_broadcasts_path(post), method: :post, class: "block text-base text-gray-600 font-normal hover:text-gray-900")
      options += button_to("Archive this post", post, method: :patch, params: { post: { status: :archived } }, class: "block text-base text-gray-600 font-normal hover:text-gray-900")
    end

    options.html_safe
  end
end
