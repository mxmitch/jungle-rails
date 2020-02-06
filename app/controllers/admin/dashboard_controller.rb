class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['TEST_USERNAME'].to_s, password: ENV['TEST_PASSWORD'].to_s
  def show
  end
end