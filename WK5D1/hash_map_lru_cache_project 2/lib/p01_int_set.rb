require "byebug"

class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max,false)
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length - 1 || num < 0
    @store[num] = true
  end

  def remove(num)
    self.store[num] = false
  end

  def include?(num)
    return true if self.store[num] == true
    false

  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket =  num % self.store.length 
    self.store[bucket] << num
  end

  def remove(num)
    bucket = num % store.length 
    self.store[bucket].delete(num)
  end

  def include?(num)
      bucket = num % store.length 
      return true if @store[bucket].include?(num)
      false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    bucket = num % num_buckets
    if !include?(num)
      self.store[bucket] << num 
      @count += 1
      if count == num_buckets
        resize!
      end
    end

  end

  def remove(num)
    bucket = num % num_buckets
    if include?(num)
      self[bucket].delete(num)
      self.count -= 1
    end



  end

  def include?(num)
    
    bucket = num % num_buckets
    return true if @store[bucket].include?(num)
    false
  end

  private

  attr_writer :count, :store

  def [](num)
    self.store[num % num_buckets]

    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    prev_num_buckets = num_buckets
    flattened = @store.flatten
    @store = Array.new(prev_num_buckets * 2) {Array.new}
    new_num_buckets = @store.length

    until flattened.empty?
      ele = flattened.shift
      bucket_num = ele % new_num_buckets
      @store[bucket_num] << ele

    end
    @store
  end
end
