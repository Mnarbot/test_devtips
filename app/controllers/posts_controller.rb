class PostsController < ApplicationController
	before_action:find_post, only: [:show,:edit,:update,:destroy]
  def index
  	@posts = Post.all.order("created_at DESC")
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)

  	if @post.save
      redirect_to @post
  	else 
  		render 'new'
	end
  end

  def show
  end

  def edit                                                                                                                  
  end

  def update
  	if @post.update(post_params)
  	   redirect_to @post
  	else
  		render 'edit'
  	end
  end

  def destroy
	@post.destroy
	redirect_to root_path
  end

  private
  def find_post

    
  	@post = Post.find_by_id params[:id]
    if @post == nil 
      render_404
    end
  end

  def post_params
  	params.require(:post).permit(:title, :body)
  end
  def render_404
  respond_to do |format|
    format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
    format.xml  { head :not_found }
    format.any  { head :not_found }
  end
end
end
