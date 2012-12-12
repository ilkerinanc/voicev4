class SettingsController < ApplicationController
  def index
  	@setting = current_user.setting || Setting.new
  end

  def update
  end
end
