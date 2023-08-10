class Rental
  def initialize(date, book)
    @date = date
    @book = book
    book&.add_rental(self)
  end

  attr_accessor :date, :book
end
