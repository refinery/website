class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # TODO : Remove this basic HTTP authentication before delivery
  before_action :authenticate, if: "Rails.env.production?"

  protected

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BHA_LOGIN"] && password == ENV["BHA_PASSWORD"]
      end
    end
end
