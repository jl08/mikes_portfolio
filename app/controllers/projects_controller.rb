class ProjectsController < ApplicationController

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
    @post = @project.posts.first
  end



  private

  def project_params
    params.require(:project).permit(:name, :section)
  end

end
