class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_logo, :set_sections

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/new
  def new
    @project = Project.find_by(id: params[:project_id])
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @project = Project.find_by(id: params[:project_id])
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
    @project = Project.find_by(id: params[:project_id])
    @section = @project.section
    @post = Post.find_by(id: params[:id])
    render partial: "single_post", layout: false
  end
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to project_post_path(@post.project,@post), notice: 'Post was successfully updated.' }
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
      format.html { redirect_to root_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_logo
      @avatar = Post.find_by(title: "avatar")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :image)
    end

    def set_sections
      @sections = Section.all
    end

end
