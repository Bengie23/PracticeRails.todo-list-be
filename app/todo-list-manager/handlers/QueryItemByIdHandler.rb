require ('../todo-list-be/app/todo-list-manager/AbstractHandler.rb') 

# This is a might-stop handler, checks for item id,if found, queries for given item, if not stops the chain and add output
class QueryItemByIdHandler < AbstractHandler
    def handle (chainable_request)
        puts "enter query item handler"
        itemId = chainable_request.input.itemId
        if (itemId)
            item = Item.find(itemId)
            
            # set successfull output with value
            chainable_request.set_output(true,"",item)
            super(chainable_request)
        else
            chainable_request.set_output_message("Unable to query data. Item Id is missing")
            return chainable_request
        end
    end
end