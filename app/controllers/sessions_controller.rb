class SessionsController < ApplicationController
    before_action :require_not_logged_in!, only: %i(create new)

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:name],params[:user][:password])
        if @user
            login_user!(@user)
            redirect_to root_url
        else
            flash.now[:error] = "Incorrect username/password"
            render :new
        end
    end

    def destroy
        logout_user!
        redirect_to new_session_url
    end
end