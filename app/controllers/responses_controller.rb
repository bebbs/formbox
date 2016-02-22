class ResponsesController < ApplicationController
  before_filter :apply_cors_policy, only: [:create]
  protect_from_forgery with: :null_session

  def create
    form = Form.find_by(uuid: params[:uuid])
    if !form
      render json: {:response => 'Could not find form'}, status: 422
      return
    end
    redirect_to dashboard_path
  end
  
  private

  def apply_cors_policy
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end