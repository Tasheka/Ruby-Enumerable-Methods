# Enumerable methods
module Enumerable
  def my_each
    return enum_for(:my_each) unless block_given?

    for value in self do
      yield value
    end
    self
  end

  def my_each_with_index
    return enum_for(:my_each_with_index) unless block_given?

    index = 0
    for value in self do
      yield(value, index)
      index += 1
    end
    self
  end

  def my_select
    return enum_for(:my_select) unless block_given?

    new_array = []
    for value in self do
      new_array.push(value) if yield value
    end
    new_array
  end

  def my_all?(arg = nil)
    conclusion = true
    for value in self do
      if !block_given? && !value
        conclusion = false
      elsif block_given? && !yield(value)
        conclusion = false
      elsif (value.instance_of?(Class) || value.instance_of?(Module)) && !value.is_a?(arg)
        conclusion = false
      elsif value.instance_of?(Regexp) && !arg.match(value)
        conclusion = false
      end
  end
    conclusion
  end

  def my_any?(arg = nil)
    conclusion = false
    for value in self do
      if !block_given? && value
        conclusion = true
      elsif block_given? && yield(value)
        conclusion = true
      elsif (value.instance_of?(Class) || value.instance_of?(Module)) && value.is_a?(arg)
        conclusion = true
      elsif arg.instance_of?(Regexp) && arg.match(value)
        conclusion = true
      end
  end
    conclusion
  end

  def my_none?(arg = nil)
    conclusion = true
    for value in self do
      if !block_given? && value
        conclusion = false
      elsif block_given? && yield(value)
        conclusion = false
      elsif (arg.instance_of?(Class) || value.instance_of?(Module)) && value.is_a?(arg)
        conclusion = false
      elsif arg.instance_of?(Regexp) && arg.match(value)
        conclusion = false
      end
    end
    conclusion
  end

  def my_count(arg = nil)
    count = 0
    if block_given?
      for value in self do
        count += 1 if yield(value)
      end
    elsif arg
      for value in self do
        count += 1 if arg == value
      end
    else
        count += 1
      end
    end
    p count
  end

  def my_map(proc = nil)
    return enum_for(:my_map) unless block_given?

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
    new_array
  end

  def my_inject(*input)
    return LocalJumpError unless block_given? && !input.nil?

    if !input[0].nil? && input[1].nil?
      input1 = input[0]
      input2 = input[0]
    elsif !input[0].nil? && !input[0].nil?
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

  def multiply_els(array)
    array.my_inject { |value1, value2| value1 * value2 }
  end
end
