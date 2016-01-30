class SectionsController < ApplicationController

  def new
  end

  def create
    @section = Post.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def section_params
    params[:section]
  end

end
