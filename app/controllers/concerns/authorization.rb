module Authorization
  extend ActiveSupport::Concern

  private
    def ensure_permissions_for(resource)
      head :forbidden unless resource.available?
    end
end
