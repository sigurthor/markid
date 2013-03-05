class BikesController < ApplicationController
  def index

    i = Bike.scoped
    i = i.includes(:bike_types)
    i = i.where("number_of_gears_id = ?",params[:gears])  if params[:gears]
    i = i.where("suspension_type_id = ?",params[:suspension])  if params[:suspension]
    i = i.where("brand_id = ?",params[:brand])  if params[:brand]
    i = i.where("bike_types.id = ?",params[:type])  if params[:type]
    i = i.order("bikes.name")

    @bikes = i

    gears_sum, sus_sum,brand_sum, type_sum  = {}, {}, {}, {}
    gears_sum.default, sus_sum.default, brand_sum.default, type_sum.default = 0,0,0,0


    @bikes.each do |bike|
      gears_sum[bike.number_of_gears_id] = gears_sum[bike.number_of_gears_id]+1
      sus_sum[bike.suspension_type_id] = sus_sum[bike.suspension_type_id]+1
      brand_sum[bike.brand_id] = brand_sum[bike.brand_id]+1
      bike.bike_type_ids.each do |id|
        type_sum[id] = type_sum[id]+1
      end
    end

    puts "#{gears_sum} gears sum"


    types = BikeType.find(type_sum.keys)
    brands = Brand.find(brand_sum.keys)
    gears = NumberOfGears.find(gears_sum.keys)
    suspension = SuspensionType.find(sus_sum.keys)

    @filters = [ {:model => 'gear', :sum => gears_sum, :data => gears, :position => (params[:gear])? 10:1},
            {:model => 'suspension', :sum => sus_sum, :data => suspension, :position => (params[:suspension])? 20:2},
            {:model => 'brand', :sum => brand_sum, :data => brands, :position => (params[:brand])? 30:3 },
            {:model => 'type', :sum => type_sum, :data => types, :position => (params[:type])? 40:4 }]

   @filters.sort! { |a,b| b[:position] <=> a[:position]}


  end

  def show
  end
end
