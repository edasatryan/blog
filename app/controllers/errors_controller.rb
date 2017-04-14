class ErrorsController < ApplicationController
  protect_from_forgery with: :null_session

  def not_found
    # 'errors/not_found'
    redirect_to "/404" # "#{Rails.root}/public/404"
  end

  def internal_server_error
    #render 'errors/internal_server_error'
    #render "#{Rails.root}/public/505.html" #(status: 500)
    redirect_to "/500"
  end
end
