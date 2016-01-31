class HomeController < ApplicationController
  def index
  end

  def about
    render :about
  end

  def application
    @projects = Project.where(section: "application")
    @post = @projects.first
    render 'posts/show'
  end

  def artwork
      @projects = Project.where(section: "artwork")
      @post = @projects.first
      render 'posts/show'
  end

  def contact
    render :contact
  end
end
