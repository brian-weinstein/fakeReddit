class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username],params[:user][:password])
        if @user
            login_user!(user)
            redirect_to root_url
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
        end
    end

    def destroy
        logout_user!
        redirect_to new_session_url
    end
end