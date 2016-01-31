class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end



  def next
    current_post = Post.find_by(id: params[:id])
    @posts = Post.where(project_id: current_post.project.id)
    positions = @posts
    if positions.index(current_post) == positions.length - 1
      next_post = 0
    else
      next_post = positions.index(current_post) + 1
    end
    redirect_to project_post_path(current_post.project,positions[next_post])
  end


  # GET /posts/new
  def new
    @project = Project.find_by(id: params[:project_id])
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Project.find_by(id: params[:project_id]).posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to project_post_path(@post.project,@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find_by(id: params[:id])
    @projects = Project.where(section: @post.project.section)
    @posts = Post.where(project_id: @post.project.id)
  end
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :image)
    end
end
