module Authorization
  extend ActiveSupport::Concern

  private
    def ensure_can_administer
      head :forbidden unless Current.user.admin?
    end

    def ensure_permissions_for(resource)
      head :forbidden unless resource.available?
    end
end
