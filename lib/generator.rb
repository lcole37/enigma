class Generator
  def random_key
    number = "0" + 4.times.map{rand(10)}.join
  end

  def keys(key)
    keys_hash = {}
    #use index to enumerate instead of hard code? letters?
    keys_hash[:A] = (key[0] + key[1]).to_i
    keys_hash[:B] = (key[1] + key[2]).to_i
    keys_hash[:C] = (key[2] + key[3]).to_i
    keys_hash[:D] = (key[3] + key[4]).to_i
    return keys_hash
  end

  def offsets(date_string)
    date_squared = date_string.to_i ** 2
    last_4_string = date_squared.to_s[-4..-1]
    offsets_hash = {}
    # does this need to be in a hash?
    #use index to enumerate instead of hard code?
    offsets_hash[:A] = (last_4_string[0].to_i)
    offsets_hash[:B] = (last_4_string[1].to_i)
    offsets_hash[:C] = (last_4_string[2].to_i)
    offsets_hash[:D] = (last_4_string[3].to_i)
    return offsets_hash
  end
end
