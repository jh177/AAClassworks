# time complexity O(n^2)
def naive_windowed_max_range(arr, w)
  current_max_range = nil

  (0..arr.length - w).each do |i|
    window = arr[i...i+w]
    max_range = window.max - window.min
    current_max_range = max_range if current_max_range.nil? || max_range > current_max_range
  end

  current_max_range
end

# p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p naive_windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


#Optimized solution:
# MyQueue
# MyStack
# StackQueue
# MinMaxStack
# MinMaxStackQueue


class MyQueue
  def initialize
    @store = []
  end

  def peek
    @store.first
  end

  def size
    @store.lengh
  end

  def empty?
    @store.empty?
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end
end

class MyStack
  def initialize
    @store = []
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push(el)
  end
end

class StackQueue
  def initialize
    @in = MyStack.new
    @out = MyStack.new
    @temp_store = MyStack.new
  end

  def size
    @out.length + @temp_store.length
  end

  def empty?
    @out.empty? && @temp_store.empty?
  end

  def enqueue(el)
    @in.push(el)
    if @out.empty?
      @out.push(el)
    else
      @temp_store.push(el)
    end
  end

  def dequeue
    el = @out.pop
    if @out.empty?
      until @temp_store.empty?
        @out.push(@temp_store.pop)
      end
    end
    return el
  end
end

class MinMaxStack
  def initialize
    @store = []
    @values = {}
    @max_value = nil
    @min_value = nil
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push(el)
    if @max_value.nil? || el > @max_value
      @max_value = el
      @values[@max_value] = el
    end
    if @min_value.nil? || el < @min_value
      @min_value = el
      @values[@min_value] = el
    end
  end

  def max
    @values[@max_value]
  end

  def min
    @values[@min_value]
  end
end


def MinMaxStackQueue
  
end


def windowed_max_range(arr, w) 

end