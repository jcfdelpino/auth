class SessionsController < ApplicationController

    def new
    end

    def create
        entered_email = params["email"]
        entered_password = params["password"]
# checking the email
        @user = User.find_by({email:entered_email})
        
        if @user # yes, email matehes
            #check password
            if BCrypt :: Password.new(@user.password) == entered_password
                sessions ["user_id"]
                redirect_to "/companies"
            else #password doesn't match
            redirect_to "sessions/new"
        end
    else# email doesn't match, we send back to the login page
        redirect_to "sessions/new"
    end

    end


end
