class ProjectsController < ApplicationController
  before_action :set_logo, :set_sections

  def index
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    @project = Project.find_by(id: params[:id])
    @section = @project.section
    @post = @project.posts.first
    render "posts/show"
  end



  private

  def project_params
    params.require(:project).permit(:title, :section_id)
  end

  def set_logo
    @avatar = Post.find_by(title: "avatar")
  end

  def set_sections
    @sections = Section.all
  end

end
