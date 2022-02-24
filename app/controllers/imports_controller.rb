class ImportsController < ApplicationController
  def index
    @imports = Import.all
  end
end