class PostSearchController < ApplicationController

  def search_example
    @posts = Post.all
  end

  def search
    if params[:search_inputs].present?
      @search_inputs = OpenStruct.new(params[:search_inputs])
    else
      @search_inputs = OpenStruct.new()
    end
  @posts = PostSearch.new(@search_inputs).search

    respond_to do |format|
      format.js
    end
  end
end
