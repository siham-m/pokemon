class CardsController < ApplicationController
  def index
    @cards = Card.all
    @cards = @cards.paginate(page: params[:page], per_page: 50)
  end
end