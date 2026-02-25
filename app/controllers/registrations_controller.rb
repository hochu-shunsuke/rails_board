class RegistrationsController < ApplicationController
  # ログインしていなくてもアクセスできるようにする（重要！）
  allow_unauthenticated_access

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # 登録と同時にログイン状態にする
      start_new_session_for @user
      redirect_to root_path, notice: "会員登録が完了しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation)
  end
end
