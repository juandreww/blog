require 'byebug'

class DeliveryMan
  def ready?
    3.times do
      puts '.'
      sleep(1)
    end

    true
  end

  def turn_on_vehicle_engine
    puts 'Turning on vehicle engine.'
  end

  def on_the_way
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
    if delivery_man.ready?
      delivery_man.turn_on_vehicle_engine
      delivery_man.on_the_way
      delivery_man.arrived_at_destination
    end
  end
end

dony = DeliveryMan.new
pizza = Pizza.new(dony)
pizza.start_delivery

RSpec.describe Pizza do
  let(:part_time_delivery_man) { double('Hamid') }
  subject { described_class.new(part_time_delivery_man) }
end