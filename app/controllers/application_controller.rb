class ApplicationController < ActionController::Base

  def set_locale
    cookies[:locale] = params[:locale]
    redirect_back(fallback_location: root_path)
  end
end
