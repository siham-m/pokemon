class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :apply_locale

  def current_user
    return nil if session[:id].nil?
    User.find(session[:id])
  end

  # quand on clique sur le btn pour changer la langue
  def set_locale
    session[:locale] = params[:locale]
    I18n.locale = session[:locale].to_sym
    return redirect_back(fallback_location: root_path)
  end

  # quand on a cliqué, on veut récuperer la valeur de la session
  def apply_locale
    if session[:locale]
      I18n.locale = session[:locale].to_sym
    else
      I18n.locale = :en
    end
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
