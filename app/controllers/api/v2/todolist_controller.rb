require('../../Practice_Api_With_Chain_Of_Responsibility/todo-list-be/app/todo-list-manager/handlers/UserIdHandler.rb') 
require('../../Practice_Api_With_Chain_Of_Responsibility/todo-list-be/app/todo-list-manager/handlers/UserNameHandler.rb') 
require('../../Practice_Api_With_Chain_Of_Responsibility/todo-list-be/app/todo-list-manager/handlers/MustHaveUserHandler.rb') 
require('../../Practice_Api_With_Chain_Of_Responsibility/todo-list-be/app/todo-list-manager/handlers/QueryItemsForUserHandler.rb') 
require('../../Practice_Api_With_Chain_Of_Responsibility/todo-list-be/app/todo-list-manager/handlers/QueryItemByIdHandler.rb') 
require('../../Practice_Api_With_Chain_Of_Responsibility/todo-list-be/app/todo-list-manager/handlers/CreateTodoItemHandler.rb') 
require('../../Practice_Api_With_Chain_Of_Responsibility/todo-list-be/app/todo-list-manager/ChainableRequest.rb') 

class Api::V2::TodolistController < ApplicationController
    before_action :find_item, only: [:update]

    def index
        @handler = UserIdHandler.new
        @userNameHandler = UserNameHandler.new
        @mustHaveUserHandler = MustHaveUserHandler.new
        @queryItemsHandler = QueryItemsForUserHandler.new
        @handler.next_handler(@userNameHandler).next_handler(@mustHaveUserHandler).next_handler(@queryItemsHandler)
        
        @chainableRequest = ChainableRequest.new(params[:user_id],params[:user_name])
        @result = @handler.handle(@chainableRequest)
        render json: @result.output
    end

    def show
        @handler = UserIdHandler.new
        @userNameHandler = UserNameHandler.new
        @mustHaveUserHandler = MustHaveUserHandler.new
        @queryItemByIdHandler = QueryItemByIdHandler.new
        @handler.next_handler(@userNameHandler).next_handler(@mustHaveUserHandler).next_handler(@queryItemByIdHandler)
        
        @chainableRequest = ChainableRequest.new(params[:user_id],params[:user_name])
        @chainableRequest.set_input_item_id(params[:id])
        @result = @handler.handle(@chainableRequest)
        render json: @result.output
    end

    def create
        @handler = UserIdHandler.new
        @userNameHandler = UserNameHandler.new
        @mustHaveUserHandler = MustHaveUserHandler.new
        @createItemHandler = CreateTodoItemHandler.new
        @handler.next_handler(@userNameHandler).next_handler(@mustHaveUserHandler).next_handler(@createItemHandler)

        @chainableRequest = ChainableRequest.new(params[:user_id],params[:user_name])
        @chainableRequest.set_input_new_item_props(params[:item])

        @result = @handler.handle(@chainableRequest)

        render json: @result.output
    end

    def update
        
    end

    def destroy
    end
end
