require ('../todo-list-be/app/todo-list-manager/AbstractHandler.rb') 

# This is a no-stop handler, checks for item props,if found, creates new todo item
class CreateTodoItemHandler < AbstractHandler
    def handle (chainable_request)
        @user = chainable_request.data.user
        if (@user)
            @description = chainable_request.input.newItem["description"]
            @priority = chainable_request.input.newItem["priority"]

            @user.tap do |user|
                
                createdItem = Item.create(description: @description, priority: @priority, user: user)
                if (createdItem)
                    chainable_request.output.successfull = true
                    chainable_request.output.message = "Item created"
                    chainable_request.output.value = createdItem
                end

            end
            

        end
        super(chainable_request)        
    end
end