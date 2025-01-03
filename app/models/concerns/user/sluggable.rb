module User::Sluggable
  extend ActiveSupport::Concern

  included do
    before_save :set_slug, if: -> { slug.blank? }
  end

  private
    def set_slug
      self.slug = "#{name.parameterize}-#{SecureRandom.hex(2)}"
    end
end
