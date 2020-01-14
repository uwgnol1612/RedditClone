class SubsController < ApplicationController 
    
    before_action :require_user!, except: [:index, :show]
    before_action :require_user_owns_sub!, only: [:edit, :update]

    def index
        @subs = Sub.all
    end

    def show
        @sub = Sub.find(params[:id])
    end

    def new
        @sub = Sub.new
    end

    def create
        @sub = current_user.subs.new(sub_params)
        if @sub.save
            redirect_to subs_url 
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find(params[:id])
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    private

    def require_user_owns_sub!
        return if current_user.subs.find_by(id: params[:id])
        render json: 'You are not allowed to edit this sub!', status: :forbidden
    end

    def sub_params
        params.require(:sub).permit(:title, :description)
    end


end