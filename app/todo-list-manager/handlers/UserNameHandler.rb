require ('../todo-list-be/app/todo-list-manager/AbstractHandler.rb') 

# This is a no-stop handler, checks for user Name,if found, queries the user and adds the object to request
class UserNameHandler < AbstractHandler
    def handle (chainable_request)
        if !(chainable_request.data.user)
            @request = chainable_request.input
            if @request
                @user_name = @request.userName
                if (@user_name)
                    @user = User.find_by username: @user_name
                    if (@user)
                        chainable_request.set_user(@user)
                    else
                        chainable_request.set_output_message("Given user name does not exist.")
                    end
                end
            end
        end

        super(chainable_request)
    end
end