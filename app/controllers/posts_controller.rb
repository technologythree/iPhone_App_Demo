class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at DESC").all

    respond_to do |format|
      format.html # index.html.erb
      format.mobile # index.mobile.erb
      format.xml  { render :xml => @posts }
    end
  end


  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.mobile # show.mobile.erb 
      format.xml  { render :xml => @post }
    end
  end


  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.mobile # new.mobile.erb
      format.xml  { render :xml => @post }
    end
  end


  def edit
    @post = Post.find(params[:id])
  end


  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.mobile { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.mobile { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.mobile { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.mobile { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.mobile { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
  
end
