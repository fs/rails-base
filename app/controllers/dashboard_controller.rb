class DashboardController < ApplicationController
  navigation :dashbaord
  before_filter :authenticate_user!

  def index
  end
end
