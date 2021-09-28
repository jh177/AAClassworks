class Integer
  # Integer#hash already implemented for you 
end

class Array
  def hash
    # self.map {|ele| ele.to_s(2)}.join.to_i.hash
    bytes_arr = self.map do |ele|
      if ele.is_a?(Integer)
        ele.to_s.bytes
      elsif ele.is_a?(String)
        ele.bytes
      elsif ele.is_a?(Symbol)
        (":"+ele.to_s).bytes
      end
    end
    bytes_arr.flatten.map {|ele| ele.to_s(2)}.join.to_i.hash
  end
end

class String
  def hash
    self.bytes.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.sort_by { |k,v| k }.flatten.hash
  end
end
