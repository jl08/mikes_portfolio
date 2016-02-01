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

  # def about
  #   render :about
  # end

  def show
    @section = Section.find_by(id: params[:id])
  end


  # def contact
  #   render :contact
  # end

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