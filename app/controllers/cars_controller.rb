class CarsController < ApplicationController

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
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to root_path, notice: '車両を更新しました'
    else
      render :edit
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  private
  def car_params
    params.require(:car).permit(:car_name,:image,:first_range ).merge(user_id: current_user.id)
  end
end
