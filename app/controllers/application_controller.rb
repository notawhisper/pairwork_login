class ApplicationController < ActionController::Base
  include SessionsHelper

  def access_controll_for_blog
    unless logged_in?
      redirect_to root_path
    end
  end
end
