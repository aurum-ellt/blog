module Post::Sluggable
  extend ActiveSupport::Concern

  included do
    before_save :set_slug, if: -> { slug.blank? }
  end

  private
    def set_slug
      self.slug = "#{title.parameterize}-#{SecureRandom.hex(6)}"
    end
end
