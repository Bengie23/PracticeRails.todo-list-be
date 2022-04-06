# Handler interface declares a method for building the chain of handlers and execute requests
class Handler
    def next_handler=(handler)
        
    end

    # @abstract
    # @param [Chainable_Request] request
    def handle(request)
    
    end
end