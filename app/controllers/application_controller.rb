class ApplicationController < ActionController::Base
  protect_from_forgery  # CSRF対策を無効
end
