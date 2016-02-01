class ProjectsController < ApplicationController
  before_action :set_logo

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
    @projects = Project.where(section: @project.section)
    @post = @project.posts.first
  end



  private

  def project_params
    params.require(:project).permit(:name, :section)
  end

  def set_logo
    @avatar = Post.find_by(title: "avatar")
  end

end
