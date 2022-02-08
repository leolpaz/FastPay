class SplashController < ApplicationController
  def index
    if user_signed_in?
      redirect_to groups_path
    end
  end
end
