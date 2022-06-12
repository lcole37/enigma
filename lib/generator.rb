class Generator
  def random_key
    number = "0" + 4.times.map{rand(10)}.join
  end
end
