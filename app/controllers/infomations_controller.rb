class InfomationsController < ApplicationController
  before_action :set_car

  def index
    # @infomation = Infomation.new
    # @infomations = @car.infomations.includes(:user)
  end

  def new
    @infomation = Infomation.new
    # @infomations = @car.infomations.includes(:user)
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

  private

  def infomation_params
    # FE = range / refuel
    params.require(:infomation).permit(:refuel, :cost, :refueldate, :ODO, :TRIP, :range, :FE, :avrage_FE, :fueltype).merge(user_id: current_user.id)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end

# refuel, null: false
#       t.integer :ODO
#       t.integer :TRIP
#       t.integer :range, null: false
#       t.integer :cost, null: false
#       t.integer :FE
#       t.integer :avrage_FE
#       t.date :refuelday
#       t.references :user, foreign_key: true
#       t.references :car, foreign_key: true
#       t.references :fueltype, foreign_key: true
