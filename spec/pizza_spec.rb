require 'byebug'

class DeliveryMan
  def ready?
    sleep(3)
    true
  end

  def turn_on_vehicle_engine
    puts 'Turning on vehicle engine.'
  end

  def delivery_on_the_way
    puts 'Delivery on the way.'
  end

  def arrived_at_destination
    puts 'Arrived at destination.'
  end
end

class Pizza
  attr_reader :delivery_man

  def initialize(delivery_man)
    @delivery_man = delivery_man
  end

  def start_delivery
    if delivery_man.
  end
end
