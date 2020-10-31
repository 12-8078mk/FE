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
      render :new, alert: "登録に失敗しました"
    end
  end

  def edit
    @infomation = Infomation.find(params[:id])
  end

  def update
    @infomation = Infomation.find(params[:id])
    if @infomation.update(infomation_params)
      redirect_to car_path(@car), notice: 'データを更新しました'
    else
      render :edit, alert: "更新に失敗しました"
    end
  end

  private

  def infomation_params
    params.require(:infomation).permit(:refuel, :cost, :refuelday, :trip, :fueltype_id).merge(user_id: current_user.id)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end

  
end