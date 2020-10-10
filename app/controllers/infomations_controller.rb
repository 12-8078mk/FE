class InfomationsController < ApplicationController
  before_action :set_car

  def index
    @infomation = Infomation.new
    @infomations = @car.infomations.includes(:user)
  end

  def new
    @infomation = Infomation.new
   
  end

  def create
    @infomation = @car.infomations.new(infomation_params)
    if @infomation.save
      redirect_to car_infomations_path(@car), notice: '入力が完了しました。'
    else
      # @infomations = @car.infomations.includes(:user)
      # flash.now[:alert] = 'メッセージを入力してください。'
      render :new
    end
  end

  def edit
    @infomation = @car.Infomation.find(params[:id])
  end

  def update
    @infomation = @car.Infomation.find(params[:id])
    if @infomation.update(infomation_params)
      redirect_to root_path, notice: '車両を更新しました'
    else
      render :edit
    end
  end

  private

  def infomation_params
    # FE = range / refuel
    params.require(:infomation).permit(:refuel, :cost, :refuelday, :trip, :fueltype).merge(user_id: current_user.id)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  
end