module Availability
  extend ActiveSupport::Concern

  def available?
    self.user == Current.user
  end
end
