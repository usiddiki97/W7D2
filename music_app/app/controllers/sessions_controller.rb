class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        user = User.find_by(
            params[:user][:email],
            params[:user][:password]
        )
        if user
            login!
            redirect_to user_url(user)
        else
            flash.now[:errors] = user.errors.full_messages
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
end
