class SellersController < ApplicationController
  before_action :set_seller, only: %i[show edit update destroy]
  before_action :check_permissions

  # GET /sellers/new
  def new
    @seller = Seller.new
  end

  def index
    @sellers = Seller.all
  end

  # POST /sellers
  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      redirect_to @seller, notice: 'Продавец успешно создан.'
    else
      Rails.logger.debug { "Errors: #{@seller.errors.full_messages.inspect}" }
      render :new, status: :unprocessable_entity
    end
  end  
  
  # PATCH/PUT /sellers/1
  def update
    if @seller.update(seller_params)
      redirect_to @seller, notice: 'Продавец успешно обновлен.'
    else
      render :edit # Отображаем форму с ошибками
    end
  end

  private

  def seller_params
    params.require(:seller).permit(:name, :contact_info, :address, :phone_number, :email, :user_id)
  end

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def check_permissions
    u = User.where(login: session['user']).first
    if u.blank? or ![1, 2].include?(u.permissions)
      redirect_to(controller: :welcome, action: :start)
    end
  end
end
