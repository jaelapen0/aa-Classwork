class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 1 if self.empty?
    id = self.last
    id = (id ** 20) / (self[0])
    id
  end
end

class String
   
  def hash
    alpha = ("a".."z").to_a
    new_str = ""

    sum = 0

    self.each_char do |char|
      idx = alpha.index(char.downcase)
      new_str += idx.to_s
      sum += idx
    end

    new_str.to_i * sum

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum1 = 0
    sum2 = 0
    self.each do |k,v|
      sum1 += (v.size + 642) * 3
      sum2 += (v.size - 311 * 3).abs
    end
    sum1 + sum2 / 2
    # 0
  end
end
