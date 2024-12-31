class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }
  protect_from_forgery with: :null_session
  allow_browser versions: :modern
end
