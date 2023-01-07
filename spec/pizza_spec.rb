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

RSpec.describe Pizza do
  let(:part_time_delivery_man) { object_double(DeliveryMan.new) }

  subject { described_class.new(part_time_delivery_man) }

  context 'when part_timer start to do delivery' do
    it 'should be able to return 3 action' do
      allow(part_time_delivery_man).to receive(:ready?).and_return(true)

      expect(part_time_delivery_man).to receive(:ready?).once
      expect(part_time_delivery_man).to receive(:turn_on_vehicle_engine).once
      expect(part_time_delivery_man).to receive(:on_the_way).once
      expect(part_time_delivery_man).to receive(:arrived_at_destination).once
      subject.start_delivery
    end
  end
end