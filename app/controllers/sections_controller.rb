class SectionsController < ApplicationController
  before_action :set_logo, :set_sections

  def index
  end

  def new
    @section = Section.new
  end

  def create
    section = Section.new(section_params)
    if section.save
      redirect_to section_path(section)
    else
      render :new
    end
  end

  def about
    @post = Post.find_by(title: "about")
    render :about
  end

  def show
    @section = Section.find_by(id: params[:id])
    if !@section.projects.nil?
      @project = @section.projects.first
      if @project
        @post = @project.posts.first
      end
    end
    render "posts/show"
  end


  def contact
    @post = Post.find_by(title: "contact")
    render :contact
  end

  def destroy
    section = Section.find_by(id: params[:id])
    section.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logo
      @avatar = Post.find_by(title: "avatar")
    end

    def section_params
      params.require(:section).permit(:title)
    end

    def set_sections
      @sections = Section.all
    end
end
