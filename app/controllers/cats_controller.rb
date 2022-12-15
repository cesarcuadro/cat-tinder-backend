class CatsController < ApplicationController

    def index
        @cat = Cat.all
        render json: @cat
    end    

    def create
        @cat = Cat.create(cat_params)
        if @cat.valid?
            render json: @cat
        else
            render errors: 'cat no worky worky'
        end
    end

    def update
        @cat = Cat.find(params[:id])
        @cat.update(cat_params)
        render json: @cat
    end

    def destroy
        @cat = Cat.find(params[:id])
        if @cat.destroy
            render json: @cat
        else
            render errors: 'cat still has lives left'
        end
    end

    private
    def cat_params
        params.require(:cat).permit(:name, :age, :enjoys, :image)
    end
end
