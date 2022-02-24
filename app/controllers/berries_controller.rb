class BerriesController < ApplicationController
  def index
    @berries = Berry.all.order(name: :asc)
    respond_to do |format|
      format.html
      format.csv do
        send_data generate_csv, filename: "berries.csv"
      end
    end
  end

  private

  def generate_csv
    headers = ['Name']
    CSV.generate do |csv|
      csv << headers
      @berries.each do |berry|
        csv << [berry.name.titleize]
      end
    end
  end
end