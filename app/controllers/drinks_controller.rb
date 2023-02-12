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

  def show
    @drink = Drink.find_by(id: params["id"])
  end

  private

  def create_params
    @create_params ||= params["drink"].permit(:brand, :name, unit: %i[unit packaging])

    @create_params["packaging"] = @create_params["unit"]["packaging"].to_i
    @create_params["unit"] = @create_params["unit"]["unit"].to_i

    @create_params
  end
end
