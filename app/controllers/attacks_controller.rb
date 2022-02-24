class AttacksController < ApplicationController
  def index
    @attacks = Attack.all.order(name: :asc)
    respond_to do |format|
      format.html
      format.csv do
        send_data generate_csv, filename: "attacks.csv"
      end
    end
  end

  def show
    @attack = Attack.find_by(name: params[:id])
    if @attack.nil?
      head :not_found
    end
  end

  private

  def generate_csv
    headers = ['Name', 'Accuracy', 'Power']
    CSV.generate do |csv|
      csv << headers
      @attacks.each do |attack|
        csv << [attack.name.titleize, attack.accuracy, attack.power]
      end
    end
  end
end