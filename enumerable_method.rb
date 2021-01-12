module Enumerable 

  def my_each
    p enum_for(:my_each) unless block_given?
    
    for value in self do
      yield (value)
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
    if !block_given? &&  !value
      conclusion = false
    elsif block_given? && !yield(value)
      conclusion = false
    elsif (value.instance_of?(Class) || value.instance_of?(Module)) && !yield(value)
      conclusion  = false
    elsif  value.instance_of?(Regexp)  && !yield(value)
    end
  end
  p conclusion
end

def my_any?
  conclusion = false
  for value in self do 
    if !block_given? &&  value
      conclusion = true
    elsif block_given? && yield(value)
      conclusion = true
    elsif (value.instance_of?(Class) || value.instance_of?(Module)) && yield(value)
      conclusion  = true
    elsif  value.instance_of?(Regexp)  && yield(value)
    end
  end
  p conclusion
end

def my_none?
  conclusion = true
  for value in self do 
    if !block_given? &&  value
      conclusion = false
    elsif block_given? && yield(value)
      conclusion = false
    elsif (value.instance_of?(Class) || value.instance_of?(Module)) && yield(value)
      conclusion  = false
    elsif  value.instance_of?(Regexp)  && yield(value)
    end
  end
  p conclusion
end
    #output = true
    #my_each(arr) do |num|
     #   if num.is_a? Integer
      #      output = false
       # end
    #end  
    #if output == false
     #   p false
    #else
     #   p true
    #end
#end

def my_count
  count = 0
  for value in self do
    count += 1 if yield(value)
  end
  p count
end

# def my_map(arr)
#   new_array = []
#   my_each(arr) do |item|
#     new_array.push(item.upcase)
#   end
#   p new_array
# end

def my_map
  p enum_for(:my_map) unless block_given?

  new_array = []
  for value in self do
    if self.instance_of?(Proc)
      new_array.push(self.call(value))
    else
      new_array.push(yield(value))
    end
    
  end
  p new_array
end

# my_each do |i|
#   result.push(input_proc.call(i)) if input_proc.is_a?(Proc)
#   result.push(yield i) if block_given? && input_proc.nil?
# end
# if value.instannce_of? (Proc)
#   new_array.push(self.call(value))
# else
#   new_array.push(yield(value))
# end


def my_inject(arr)
    sum = 0
    my_each(arr) do |value|
        sum += value
    end
    p sum
end

end
