require ('../todo-list-be/app/todo-list-manager/AbstractHandler.rb') 

# This is a no-stop handler, checks for user Id,if found, queries the user and adds the object to request
class UserIdHandler < AbstractHandler

    def handle (chainable_request)
        @request = chainable_request.input
        if @request
            @user_id = @request.userId
            if (@user_id)
                @user = User.find_by_id(@user_id)
                if (@user)
                    chainable_request.set_user(@user)
                else
                    chainable_request.set_output_message("The given user id does not exist")
                end
            end
        end

        super(chainable_request)
    end
end