class TagsController < ApplicationController
    before_filter :require_login, only: [:destroy]
    add_breadcrumb "Tags", '/tags.html'

    def show
        @tag = Tag.find(params[:id])
        add_breadcrumb @tag.name, tag_path(@tag)
    end

    def index
        @tags = Tag.all
    end

    def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy

        flash.notice = "Tag '#{@tag.name}' Destroyed!"
        redirect_to tags_path
    end
end
