class PagesController < ApplicationController
  before_action :authenticate_user!, only: :dashboard
  
  def home
  end
  
  def dashboard
    @forms = current_user.forms
  end
end