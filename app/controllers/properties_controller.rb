class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  def index
    @property = Property.all
  end

  def new
    @property = Property.new
    2.times { @property.stations.build }
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: "登録しました"
    else
      render new
    end
  end

  def show
    @stations = @property.stations
  end

  def edit
    3.times { @property.stations.build }
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice:"編集しました"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to properties_path, notice:"削除しました"
  end

  private

  def property_params
    params.require(:property).permit(:name,
                                      :price,
                                      :address,
                                      :age,
                                      :remarks,
                                      stations_attributes: %i[ root_name station_name time id ])
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
