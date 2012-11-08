class BikesController < ApplicationController
  def index
    @types = BikeType.includes(:bikes).order(:type_order).all
    @brands = Brand.all
    @gears = NumberOfGears.all
    @suspension = SuspensionType.all
  end

  def show
  end
end
