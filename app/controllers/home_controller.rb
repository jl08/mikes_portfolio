class HomeController < ApplicationController
  def index
  end

  def about
    render :about
  end

  def application
    @posts = Post.where(section: "application")
    render 'posts/index'
  end

  def artwork
      @posts = Post.where(section: "artwork")
      render 'posts/index'
  end

  def contact
    render :contact
  end
end
