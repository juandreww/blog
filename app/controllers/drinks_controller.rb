class DrinksController < ApplicationController
  def new
    @drink = Drink.new
    render "new"
  end

  def create
    byebug
  end
end
