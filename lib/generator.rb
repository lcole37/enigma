class Generator
  def random_key
    number = "0" + 4.times.map{rand(10)}.join
  end

  def keys(key)
    key_array = key.split("")
    keys_hash = {}
    #use index to enumerate instead of hard code? letters?
    keys_hash[:A] = (key_array[0] + key_array[1]).to_i
    keys_hash[:B] = (key_array[1] + key_array[2]).to_i
    keys_hash[:C] = (key_array[2] + key_array[3]).to_i
    keys_hash[:D] = (key_array[3] + key_array[4]).to_i
    return keys_hash
  end
end
