class CardsController < ApplicationController
  def index
    @cards = Card.all
    respond_to do |format|
      format.html do
        @cards = @cards.paginate(page: params[:page], per_page: 50)
      end
    end
  end
end