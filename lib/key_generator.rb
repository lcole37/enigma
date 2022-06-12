class KeyGenerator
  def random
    number = 4.times.map{rand(10)}.join
    padded_number = "0" + number
  end
end
