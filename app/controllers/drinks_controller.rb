class DrinksController < ApplicationController
  def new
    @drink = Drink.new
    render "new"
  end

  def create
    @drink = Drink.new(create_params)

    if @drink.save
      redirect_to @drink
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def create_params
    @create_params ||= params["drink"].permit(:brand, :name, :unit)
  end
end
