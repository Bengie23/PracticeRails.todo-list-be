require ('../todo-list-be/app/todo-list-manager/AbstractHandler.rb') 

# This is a might-stop handler, checks for user,if found, queries items for given user, if not stops the chain and add output
class QueryItemsForUserHandler < AbstractHandler
    def handle (chainable_request)
        puts "enter query items handler"
        user = chainable_request.data.user
        if (user)
            items = Item.where user_id: user.id
            
            # set successfull output with values
            chainable_request.set_output(true,"",items)
            super(chainable_request)
        else
            chainable_request.set_output_message("Unable to query data. User information is missing")
            return chainable_request
        end
    end
end