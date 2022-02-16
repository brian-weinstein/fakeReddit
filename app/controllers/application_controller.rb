class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :is_moderator?

    private
    def require_not_logged_in!
        redirect_to subs_url if current_user
    end

    def require_logged_in!
        redirect_to new_session_url if current_user.nil?
    end

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login_user!(user)
        session[:session_token] = @user.reset_session_token!
    end
    
    def logout_user!
        current_user.reset_session_token!
        session[:session_token] = nil
    end

    def logged_in?
        !current_user.nil?
    end

    def is_moderator?(sub)
        current_user == sub.moderator
    end
end
