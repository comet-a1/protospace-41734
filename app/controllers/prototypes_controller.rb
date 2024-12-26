class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.includes(:user)
    @user = current_user
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'プロトタイプが保存されました。'
    else
      render :new, alert: 'プロトタイプの保存に失敗しました。'
    end
  end

  def show
    @user = @prototype.user
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)

  end

  def edit
    unless @prototype.user == current_user
      redirect_to root_path
    end
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to @prototype, notice: 'プロトタイプが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to root_path, notice: 'プロトタイプが削除されました。'
    else
      redirect_to @prototype, alert: '削除に失敗しました。'
    end
  end

private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to prototypes_path
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end