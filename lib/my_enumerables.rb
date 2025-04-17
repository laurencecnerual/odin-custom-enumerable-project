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
    newArr = []

    self.my_each do |element|
      if yield(element)
        newArr.push(element)
      end
    end

    return newArr
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
