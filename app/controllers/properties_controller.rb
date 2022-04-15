class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def new
    @properties = Property.new
  end
end
