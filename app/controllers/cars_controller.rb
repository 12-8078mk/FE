class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :update, :show]

  def index
  end
  
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to root_path, notice: '車両を登録しました'
    else
      render :new, alert: "登録に失敗しました"
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to root_path, notice: '車両を更新しました'
    else
      render :edit, alert: "更新に失敗しました"
    end
  end

  def show
  end

  def destroy
    car = Car.find(params[:id])
    if car.user_id == current_user.id
      if car.destroy
        redirect_to root_path, notice: '車両情報を削除しました'
      else
        redirect_to root_path, alert: "削除が失敗しました"
      end
    end
  end

  private
  def car_params
    params.require(:car).permit(:car_name,:image,:first_range ).merge(user_id: current_user.id)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
