class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    resize! if count == num_buckets 
    unless self.include?(key)
      self[num].push(key)
      @count += 1
    end
  end

  def include?(key)
    num = key.hash
    self[num].include?(key)
  end

  def remove(key)
    num = key.hash
    if self.include?(key)
      self[num].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    num_bucket = num % num_buckets
    @store[num_bucket]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) {Array.new}

    @store.flatten.each do |ele|
      new_num_bucket = ele.hash % new_store.length
      new_store[new_num_bucket].push(ele)
    end
    @store = new_store
  end
end
