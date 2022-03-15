class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def show
    @post = Post.new(params["post"])
  end

  def create
    if @current_user
    @post = Post.new(params["post"])
    @post.user_id = @current_user.id
    @post.save
    redirect_to "/places/#{@post.place.id}"
    else
      flash[:notice] = "Please Login"
  end
end

end