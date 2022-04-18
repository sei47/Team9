class PropertiesController < ApplicationController

  def index
    @property = Property.all
  end

  def new
    @property = Property.new
    2.times { @property.stations.build }
  end
end
