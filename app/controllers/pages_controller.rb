class PagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard
  
  def home
    redirect_to dashboard_path if current_user
  end
  
  def dashboard
    @forms = current_user.forms.published
    @responses = Response.all
  end
end