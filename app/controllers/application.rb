class ApplicationController < ActionController::Base
  session :session_key => '_monkeytasks_session_id'
  include AuthenticatedSystem
  before_filter :login_from_cookie
end
