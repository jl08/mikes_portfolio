class HomeController < ApplicationController
  def index

  end

  def about
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
end
