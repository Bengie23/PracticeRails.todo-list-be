require ('../todo-list-be/app/todo-list-manager/handler.rb') 

class AbstractHandler < Handler
    attr_writter = :next_handler

    def next_handler(handler)
        @next_handler = handler

        handler
    end

    def handle(request)
        if @next_handler
            return @next_handler.handle(request) 
        else
            return request
        end
    end
end