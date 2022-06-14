class Generator

  def initialize(name, key, date)
    @name = name
    @key_string = key
    @date_string = date
    @keys_hash = {}
    @offsets_hash = {}
    @symbols_array = [:A, :B, :C, :D]
  end

  def generate_keys
    key_array = @key_string.split("")
    @symbols_array.each_with_index {|symbol, index| @keys_hash[symbol] = (@key_string[index] + @key_string[index + 1]).to_i}
    return @keys_hash
  end

  def generate_offsets
    date_squared = @date_string.to_i ** 2
    last_4_string = date_squared.to_s[-4..-1]
    @symbols_array.each_with_index {|symbol, index| @offsets_hash[symbol] = (last_4_string[index]).to_i}
    return @offsets_hash
  end

  def final_shifts
    generate_keys
    generate_offsets
    @keys_hash.merge(@offsets_hash){ |k, key, offset| key + offset }
  end
end

#================= ALTERNATIVE SOLUTIONS ====================

# def keys
#   key_array = @key_string.split("")
#   @keys_hash[:A] = (@key_string[0] + @key_string[1]).to_i
#   @keys_hash[:B] = (@key_string[1] + @key_string[2]).to_i
#   @keys_hash[:C] = (@key_string[2] + @key_string[3]).to_i
#   @keys_hash[:D] = (@key_string[3] + @key_string[4]).to_i
#   return @keys_hash
# end

# def offsets
#   date_squared = @date_string.to_i ** 2
#   last_4_string = date_squared.to_s[-4..-1]
#   @offsets_hash[:A] = (last_4_string[0].to_i)
#   @offsets_hash[:B] = (last_4_string[1].to_i)
#   @offsets_hash[:C] = (last_4_string[2].to_i)
#   @offsets_hash[:D] = (last_4_string[3].to_i)
#   return @offsets_hash
# end
