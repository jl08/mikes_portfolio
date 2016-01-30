class HomeController < ApplicationController
  def index
  end

  def about
  end

  def application
    @posts = Post.all
  end



end
