class PostsController < ApplicationController
  def index
    @posts = Post.order('id DESC')
  end #Automatically loads app/views/posts/index.html.erb

  def show
    @post = Post.find(params[:id])
  end #Automatically loads app/views/posts/show.html.erb
  
  def new
    @post = Post.new
  end #Automatically loads app/view/posts/new.html.erb
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      #redirect to the index actions
      redirect_to :action => :index
    else
      #load up the view associated with the new action
      render :action => :new
    end
  end #On success redirects to index, else uses new.html.erb
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :action => :index
  end #No destroy.html.erb needs to exist, we always redirect
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    #update and save this post using the user data
    @post.update_attributes(params[:post])
    
    if @post.save
      #redirect to the index actions
      redirect_to :action => :index
    else
      #load up the view associated with the new action
      render :action => :edit
    end
  end
end
