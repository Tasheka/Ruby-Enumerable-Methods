public def my_each(arr)
  arr.each do |name|
    yield name
  end
end

names = %w[Amy John Joe]

my_each(names) { |a| puts "Hello #{a}" }

def my_each_with_index(arr)
  len = arr.length

  i = 1

  arr.each do |item|
    yield item if i <= len && i.even?

    i += 1
  end
end

grocery_list = %w[banana plum chocolate toiletries]

my_each_with_index(grocery_list) { |m| puts "Please get #{m}" }

def my_select(arr)
  new_array = []
    for val in arr do  
      unless val.is_a? Integer
        new_array.push(val)
      end
    end
    p new_array
end
    new_list = ["a", "b", "c", 3]
  my_select(new_list)
  

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
    new_element = [1, 3, 2]
my_all(new_element)

def my_any(arr)
    for f in arr do 
        if f.is_a? Integer
            puts true
        end
    end  
    puts false 
end
    new_element = ["a", "b"]
my_all(new_element)

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
    new_element = ["a", "g" "c"]
my_none(new_element)


    
