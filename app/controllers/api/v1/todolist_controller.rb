require('json')
class Api::V1::TodolistController < ApplicationController
    before_action :find_item, only: [:update]

    def index
        @user = nil
        if request.query_parameters.present?
            @user_id = params[:user_id]
            if (@user_id)
                @user = User.find(@user_id)
            end

            @user_name = params[:user_name]
            if (@user_name)
                @user = User.find_by username: @user_name
            end
        end

        if (@user)
            @items = Item.where user_id: @user.id
            render json: @items
        else
            render json: { message: "Unable to perform operation. Given user does not exist."}
        end
        
    end

    def show
        @user = nil
        if request.query_parameters.present?
            @user_id = params[:user_id]
            if (@user_id)
                @user = User.find(@user_id)
            end

            @user_name = params[:user_name]
            if (@user_name)
                @user = User.find_by username: @user_name
            end
        end

        if (@user)
            @item= Item.find_by_id(params[:id])
            render json: @item
        else
            render json: { message: "Unable to perform operation. Given user does not exist."}
        end
    end

    def create
        @user = nil
        if request.query_parameters.present?
            @user_id = params[:user_id]
            if (@user_id)
                @user = User.find(@user_id)
            end

            @user_name = params[:user_name]
            if (@user_name)
                @user = User.find_by username: @user_name
            end
        end

        if (@user)
            @item = Item.new(item_params)
            if (@item.save)
                render json: @item
            else
                render json: {message:"failed to save new item"}
            end
        else
            render json: { message: "Unable to perform operation. Given user does not exist."}
        end
    end

    def update
        if (@item)
            @item.update(item_params)
            render json: {message:"successfully updated item", value:@item}
        else
            render json: {message:"unable to update item"}
        end
    end

    def destroy
    end

    private

    def item_params
        params.permit(:description,:priority, :user_id)
    end

    def find_item
        @item = Item.find(params[:id])
    end
end
