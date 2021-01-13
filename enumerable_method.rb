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

  def my_count(param = nil)
    c = 0
    if block_given?
      to_a.my_each { |item| c += 1 if yield(item) }
    elsif !block_given? && param.nil?
      c = to_a.length
    else
      c = to_a.my_select { |item| item == param }.length
    end
    c
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

  def my_inject(initial = nil, sym = nil)
    if (!initial.nil? && sym.nil?) && (initial.is_a?(Symbol) || initial.is_a?(String))
      sym = initial
      initial = nil
    end
    if !block_given? && !sym.nil?
      to_a.my_each { |item| initial = initial.nil? ? item : initial.send(sym, item) }
    else
      to_a.my_each { |item| initial = initial.nil? ? item : yield(initial, item) }
    end
    initial
  end
end

def multiply_els(arr)
  arr.my_inject(1, '*')
end
