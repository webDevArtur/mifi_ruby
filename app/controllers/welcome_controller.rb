class WelcomeController < ApplicationController
  skip_before_action :check_auth, only: [:start, :destroy]

  def start
    if params[:login].present? && params[:plain_password].present?
      user = User.find_by(login: params[:login])
      if user && user.check_password(params[:plain_password])
        session[:user] = user.login
        redirect_to products_path
      else
        flash[:alert] = 'Неверные данные для входа.'
        render :start, status: :unauthorized
      end
    else
      flash[:alert] = 'Введите логин и пароль.'
      render :start, status: :bad_request
    end
  end
  

  def destroy
    session.delete(:user)
    reset_session
    redirect_to root_path, notice: 'Вы успешно вышли из системы.'
  end
end
