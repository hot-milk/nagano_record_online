class LabelsController < ApplicationController
  def index
  	@labels = Label.all
  end

  def new
  end

  def edit
  end
end
