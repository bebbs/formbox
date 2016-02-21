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
  
  private
  def form_params
    params.require(:form).permit(:name, :redirect_url, :webhook_url)
  end
end