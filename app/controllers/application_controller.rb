class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


# # You want to get exceptions in development, but not in production.
#   if Rails.application.config.consider_all_requests_local
#     rescue_from ActionController::RoutingError, with: -> { on_not_found  } #render_404
#   end
#
#   def render_404
#     respond_to do |format|
#       format.html { render template: 'errors/not_found', status: 404 }
#       format.all { render nothing: true, status: 404 }
#     end
#   end
#
#   def on_not_found
#     #Rails.logger.error(error)
#     fail(404, 'resource not found')
#   end


end
