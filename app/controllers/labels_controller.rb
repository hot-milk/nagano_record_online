class LabelsController < ApplicationController
  before_action :admin_user
  
  def index
  	@labels = Label.all
  end

  def new
  	@label = Label.new
  end

  def create
  	label = Label.new(label_params)
  	label.save
  	redirect_to labels_path
  end

  def edit
  	@label = Label.find(params[:id])
  end

  def update
    label = Label.find(params[:id])
    label.update(label_params)
    redirect_to labels_path
  end

  def destroy
    label = Label.find(params[:id])
    label.destroy
    redirect_to labels_path
  end

  private

  def label_params
    params.require(:label).permit(:label_name)
  end
end
