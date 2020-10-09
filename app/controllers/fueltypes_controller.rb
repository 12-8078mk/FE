class FueltypesController < ApplicationController

  def new
    @fuelname = Fueltype.new
  end

  def create
    @fuelname = Fueltype.new(f_params)
    if @fuelname.save
      redirect_to root_path, notice: '油種を登録しました'
    else
      render :new
    end
  end

  private
  def f_params
    params.require(:fueltype).permit(:fuelname)
  end
  
end
