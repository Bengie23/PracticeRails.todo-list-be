require('json')

class ChainableRequest
    attr_accessor :input, :output, :data
    
    def initialize(userId,userName)
        @data = RequestData.new(nil)
        @input = Input.new(userId,userName)
        @output = Output.new(nil)
    end

    def set_user(user)
       @data.user = user
    end

    def set_input_item_id(itemId)
        @input.set_item_id(itemId)
    end


    def set_input_new_item_props(props)
        @input.set_new_item_props(props)
    end

    def set_output_message(message)
        @output.message = message
    end

    def set_output_status(successfull)
        @output.successfull = successfull
    end

    def set_output_value(value)
        @output.value = value
    end

    def set_output(status,message,value)
        @output.message = message
        @output.successfull = status
        @output.value = value
    end

end

class Input
    attr_accessor :userId, :userName, :itemId, :newItem

    def initialize(userId,userName)
        @userId = userId
        @userName = userName
    end

    def set_item_id(itemId)
        @itemId = itemId
    end

    def set_new_item_props(props)
        @newItem = props
    end
end

class Output
    attr_accessor :message, :successfull, :value

    def initialize(message)
        if !(message)
            message = "Something went wrong"
        end
        @successfull = false
        @message = message
    end
end

class RequestData
    attr_accessor :user
    
    def initialize(user)
        @user = user
    end
end