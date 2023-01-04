class Actor
  def initialize(name)
    @name = name
  end

  def ready?
    sleep(3)
    true
  end

  def act
    'I love you, baby'
  end

  def fall_off_ladder
    'Call my agent! No Way!'
  end

  def light_on_fire
    false
  end
end

class Movie
  attr_reader :actor

  
end
