class LabelsController < ApplicationController
  before_action :admin_user
  
  def index
  	@labels = Label.page(params[:page])
  end

  def new
  	@label = Label.new
  end

  def create
  	@label = Label.new(label_params)
    if @label.save
      flash[:notice] = "レーベルを登録しました。"
  	　redirect_to labels_path
    else
      flash[:notice] = "レーベルの登録に失敗しました。もう一度登録内容を確認してください。"
      render :new
    end
  end

  def edit
  	@label = Label.find(params[:id])
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(label_params)
      flash[:notice] = "レーベル情報を更新しました。"
      redirect_to labels_path
    else
      flash[:notice] = "レーベル情報の更新に失敗しました。もう一度更新内容を確認してください。"
      render :edit
    end
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
