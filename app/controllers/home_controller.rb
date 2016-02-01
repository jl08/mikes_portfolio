class HomeController < ApplicationController
  before_action :set_logo

  def index

  end

  def about
    @avatar =
    render :about
  end

  def application
    @projects = Project.where(section: "application")
    @project = @projects.first
    @post = @project.posts.first
    render 'posts/show'
  end

  def artwork
      @projects = Project.where(section: "artwork")
      @project = @projects.first
      @post = @project.posts.first
      render 'posts/show'
  end

  def contact
    render :contact
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logo
      @avatar = Post.find_by(title: "avatar")
    end

end
