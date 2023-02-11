class DrinksController < ApplicationController
  def new
    @drink = Drink.new
    render "new"
  end
end
