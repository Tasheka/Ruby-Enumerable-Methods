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
  len = arr.length
  arr.each do |val|
    new_array.push(val) unless val.is_a? Integer
  end
  p new_array
end
new_list = ['a', 'b', 'c', 3]
my_select(new_list)

def my_all(arr)
  a = 0
  len = arr.length
  arr.each do |f|
    a += 1 if f.is_a? Integer
  end
  if a == len
    p true
  else
    p false
  end
end
new_element = [1, 3, 2]
my_all(new_element)
