module Post::Sluggable
  extend ActiveSupport::Concern

  included do
    before_create :set_slug
  end

  private
    def set_slug
      self.slug = "#{title.parameterize}-#{SecureRandom.hex(6)}"
    end
end
