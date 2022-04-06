require ('../todo-list-be/app/todo-list-manager/AbstractHandler.rb') 

# This is a might-stop handler, checks for user,if found, continues, if not stops the chain
class MustHaveUserHandler < AbstractHandler
    def handle (chainable_request)
        
        if chainable_request.data.user
            super(chainable_request)
        else
            return chainable_request
        end
    end
end