class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['TEST_USERNAME'].to_s, password: ENV['TEST_PASSWORD'].to_s
  # before_filter :authorize

  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end