class ResponsesController < ApplicationController
  before_filter :apply_cors_policy, only: [:create]
  protect_from_forgery with: :null_session

  def create
    form = Form.find_by(uuid: params[:uuid])
    if !form
      render json: {:response => 'Could not process form'}, status: 422
      return
    end
    
    build_data_params(params)
    response = form.responses.new(response_params)
    response.save!

    redirect_to form.redirect_url
  end
  
  private

  def apply_cors_policy
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
  
  def response_params
    params.require(:response).permit(:data)
  end
  
  def build_data_params(params)
    data = {}
    
    params.each do |k,v|
      next if k == "uuid" || k == "controller" || k == "action"
      data[k] = v
      params.delete(k)
    end
    
    params[:response] = {data: data}
  end
end