module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    return self.my_each do |element|
      yield(element, index)
      index += 1
    end
  end

  def my_select
    new_arr = []

    self.my_each do |element|
      if yield(element)
        new_arr.push(element)
      end
    end

    return new_arr
  end

  def my_all?
    return self.my_select { |element| yield(element) }.length == self.length
  end

  def my_any?
    return self.my_select { |element| yield(element) }.length > 0
  end

  def my_none?
    return self.my_select { |element| yield(element) }.length == 0
  end

  def my_count
    if block_given?
      return self.my_select { |element| yield(element) }.length
    end

    return self.length
  end

  def my_map
    my_arr = []

    self.my_each do|element| 
      my_arr.push(yield(element))
    end

    return my_arr
  end

  def my_inject(initial_value)
    result = initial_value

    self.my_each do |element| 
      result = yield(result, element) 
    end

    return result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      for element in self
        yield(element)
      end
    end

    return self
  end
end