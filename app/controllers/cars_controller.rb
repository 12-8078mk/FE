class CarsController < ApplicationController
  
  def index
    # @cars = Car.all
    # Car.find(current_user[:id])
  end
  
  def new
    @car = Car.new
    # @car.users << current_user
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

  private
  def car_params
    params.require(:car).permit(:car_name,:first_range ).merge(user_id: current_user.id)
    # , user_ids: []
  end
end
