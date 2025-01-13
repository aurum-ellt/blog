Rails.application.configure do
  MissionControl::Jobs.base_controller_class = "ActionController::Base"
  MissionControl::Jobs.http_basic_auth_enabled = !Rails.env.local?
end
