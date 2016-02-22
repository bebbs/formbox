class FormsController < ApplicationController
  before_action :authenticate_user!

  def new
    @form = current_user.forms.new
  end
  
  def create
    @form =  current_user.forms.new(form_params)
    if @form.save 
      redirect_to dashboard_path, notice: 'Form was successfully created'
    else
      render :new
    end
  end
  
  def edit
    @form = Form.find_by(uuid: params[:uuid])
    redirect_to dashboard_path if !@form
  end
  
  def archive
    form = Form.find(params[:id])
    form.archived!
    flash[:notice] = "#{form.name} is now archived"
    redirect_to '/dashboard'
  end
  
  def responses
    
  end
  
  private
  def form_params
    params.require(:form).permit(:name, :redirect_url, :webhook_url)
  end
end