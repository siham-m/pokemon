class ApplicationController < ActionController::Base

  def set_locale
    cookies[:locale] = params[:locale]
    redirect_back(fallback_location: root_path)
  end

  def authenticate_api
    token = request.headers['Authorization']
    if token.nil?
      token = params[:token]
      if token.nil?
        return render json: { error: 'You must have a token' }
      end
    end
    user = User.find_by(token: token)
    if user.nil?
      return render json: { error: 'Invalid token' }
    end
  end
end
