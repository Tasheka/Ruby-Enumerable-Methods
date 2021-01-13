# Enumerable methods
module Enumerable
  def my_each
    p enum_for(:my_each) unless block_given?
    for value in self do
      yield value
    end
    p self
  end

  def my_each_with_index
    p enum_for(:my_each_with_index) unless block_given?
    index = 0
    for value in self do
      yield(value, index)
      index += 1
    end
    p self
  end

  def my_select
    p enum_for(:my_select) unless block_given?
    new_array = []
    for value in self do
      new_array.push(value) if yield value
    end
    p new_array
  end

  def my_all?
    conclusion = true
    for value in self do
      if !block_given? && !value
        conclusion = false
      elsif block_given? && !yield(value)
        conclusion = false
      elsif (value.instance_of?(Class) || value.instance_of?(Module)) && !yield(value)
        conclusion = false
      elsif value.instance_of?(Regexp) && !yield(value)
      end
  end
    p conclusion
  end

  def my_any?
    conclusion = false
    for value in self do
      if !block_given? && value
        conclusion = true
      elsif block_given? && yield(value)
        conclusion = true
      elsif (value.instance_of?(Class) || value.instance_of?(Module)) && yield(value)
        conclusion = true
      elsif value.instance_of?(Regexp) && yield(value)
      end
  end
    p conclusion
  end

  def my_none?
    conclusion = true
    for value in self do
      if !block_given? && value
        conclusion = false
      elsif block_given? && yield(value)
        conclusion = false
      elsif (value.instance_of?(Class) || value.instance_of?(Module)) && yield(value)
        conclusion = false
      elsif value.instance_of?(Regexp) && yield(value)
      end
  end
    p conclusion
  end

  def my_count
    count = 0
    for value in self do
      count += 1 if yield(value)
  end
    p count
  end

  def my_map(proc = nil)
    p enum_for(:my_map) unless block_given?
    new_array = []
    if proc
      for value in self do
        new_array.push(proc.call(value))
    end
    else
      for value in self do
        new_array.push(yield(value))
    end
    end
    p new_array
  end

  def my_inject(*input)
    p LocalJumpError unless block_given? && !input.nil?
    if input.length == 1 && input[0].is_a?(Integer)
      input1 = input[0]
      input2 = input[0]
    elsif input.length > 1 && input[0].is_a?(Integer) && input[1].is_a?(Integer)
      input1 = input[0]
      input2 = input[1]
    end
    if input2
      for value in self do
        input2.send.call(input1, value)
    end
    elsif !input2
      for value in self do
        yield(input1, value)
    end
    end
  end
end
