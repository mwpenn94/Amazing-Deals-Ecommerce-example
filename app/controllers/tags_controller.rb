class TagsController < ApplicationController
    def index
        @tags = Tag.all
    end

    def new
        @tag = Tag.new
    end

    def create
        @tag = Tag.new(tag_params)
        @tag.save
        redirect_to tags_path
    end

    def edit
        @tag = Tag.find(params[:id])
    end

    def update
        @tag = Tag.find(params[:id])
        @tag.update(tag_params)
        redirect_to tag_path(@tag)
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy
        redirect_to tags_path
    end
    private

    def tag_params
        params.require(:tag).permit(:name, :created_at, :updated_at)
    end
end
