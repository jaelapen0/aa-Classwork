class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    
  end

  def insert(key)
    if key.is_a?(Integer)
          bucket = key % num_buckets
          @store[bucket].push(key)
    elsif key.is_a?(String) || key.is_a?(Symbol)
          new_str = ""
          key.to_s.each_char {|char| new_str += char.ord.to_s}
          key_magic_num = new_str.to_i
          bucket = key_magic_num % num_buckets
          @store[bucket].push(key)
    elsif key.is_a?(Array)
        #return 1 if self.empty?
        if key.last.class == Integer
          ele = key.last
          key_magic_num = (ele ** 20) / (key[0])
          bucket = key_magic_num % num_buckets
          @store[bucket].push(key)
        else #then it's an array, hash, set, symbol

        end
    end
  end
  

  def in_the_bucket?(key,value=nil)
    if value.nil?
      bucket = key % num_buckets
      return true if @store[bucket].include?(key)
    else
      bucket = key % num_buckets
      return true if @store[bucket].include?(value)
    end
      false
      
  end

  
  def include?(key)
    if key.is_a?(Integer)
      return in_the_bucket?(key)
      #  bucket = key % num_buckets
      #  return true if @store[bucket].include?(num)
      #  false
    elsif key.is_a?(String) || key.is_a?(Symbol) 

       new_str = ""
       key.to_s.each_char {|char| new_str += char.ord.to_s}
       key_magic_num = new_str.to_i
       return in_the_bucket?(key_magic_num, key)
    elsif key.is_a?(Array)
        if key.class == Integer
          ele = key.last
          key_magic_num = (ele ** 20) / (key[0])
          bucket = key_magic_num % num_buckets
          return in_the_bucket?(key_magic_num, key)
        else
    # elsif key.is_a?(Hash)
        end
    end
    
   
  end

  def remove(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
