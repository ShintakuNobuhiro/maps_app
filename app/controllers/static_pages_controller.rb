class StaticPagesController < ApplicationController
  def home
    @record = current_user.records.build if signed_in?
  end

  def about
  end
  
  def contact
  end
end