class FueltypesController < ApplicationController

  # def new
  #   @fuelnames = Fueltype.all
  # end

  def create
    @fuelname = Car.new(fuel_params)
    if @@fuelname.save
      redirect_to new_infomation_path, notice: '油種を登録しました'
    else
      render :new
    end
  end

  private
  def fuel_params
    params.require(:fueltype).permit(:fuelname)
  end
end
