class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation,:image))
    @user[:image_name] = "default_icon.jpg"
    if @user.save
    flash[:notice] = "ユーザーを新規登録しました"
    redirect_to root_url
    else
    render "new"
    end
  end

  def show
    @user = current_user
    @room = Room.new
    @rooms = @user.rooms #リレーションを定義することでこのような記述が可能

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:name, :email, :introduction, :image, :password, :password_confirmation))
    flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
    redirect_to root_url
    else
    render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :users 
  end
  
  def account
    @user = current_user
  end 
  
end
