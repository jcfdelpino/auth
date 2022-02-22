class SessionsController < ApplicationController
    def new
    end

    def create
        entered_email = params["email"]
        entered_password = params["password"]
        @user = User.find_by({email: entered_email})
            # checking the email
        if @user # yes, email matches
            # checking the password
            if BCrypt::Password.new(@user.password)==entered_password
                # the password matches!
                session["user_id"] = @user.id
                flash[:notice] = "Welcome #{@user.first_name}!"
                redirect_to "/companies"
            else
                # password doesn't math
                flash[:notice] = "Password is incorrect"
                redirect_to "/sessions/new"
            end
        else
            # email doesn't match, send back to the login page
            flash[:notice] = "No user found"
            redirect_to "/sessions/new"
        end
    end

    def destroy
        session["user_id"] = nil
        flash[:notice] = "You have been logged out"
        redirect_to "/sessions/logout"
    end


end


