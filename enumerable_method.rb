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
  
def my_all(arr)
    a=0
    len = arr.length
    for f in arr do 
        if f.is_a? Integer
            a+=1
        end
    end   
    if a == len
        p true
    else
        p false
    end
end

def my_any(arr)
    for f in arr do 
        if f.is_a? Integer
            puts true
        end
    end  
    puts false 
end

def my_none(arr)
    output = true
    my_each(arr) do |num|
        if num.is_a? Integer
            output = false
        end
    end  
    if output == false
        p false
    else
        p true
    end
end

def my_count(arr)
  count = 0
  my_each(arr) do |num|
    count+= 1
    if arr
      count += 1 if arr == num
    else
      count+= 1  
    end
  end
  puts count
end

def my_map(arr)
  new_array = []
  my_each(arr) do |item|
    new_array.push(item.upcase)
  end
  p new_array
end

def my_inject(arr)
    sum = 0
    my_each(arr) do |value|
        sum += value
    end
    p sum
end

end

