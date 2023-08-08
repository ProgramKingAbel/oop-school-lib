class Animal
  def initialize(type, number_of_legs, name = 'unknown')
    @id = Random.rand(1..1000)
    @number_of_legs = number_of_legs
    @name = name
    @type = type
  end

  attr_accessor :name
  attr_reader :id, :number_of_legs, :type

  def speak
    'grrrr'
  end
end
