class FueltypesController < ApplicationController

  def new
    @fuelname = Fueltype.new
  end

  def create
    @fuelname = Fueltype.new
    if @@fuelname.save
      redirect_to new_infomation_path, notice: '油種を登録しました'
    else
      render :new
    end
  end

  
end
