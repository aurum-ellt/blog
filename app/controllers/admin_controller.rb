class AdminController < ApplicationController
  before_action :ensure_can_administer
end
