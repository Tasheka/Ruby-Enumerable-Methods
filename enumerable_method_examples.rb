require "./enumerable_method"

#Example for the my_each method
names = ["Amy", "John", "Joe"]
names.my_each {|name| p "Hello #{name}"}

#Example for the my_each_with_index method
grocery_list = ["bananas", "plums", "chocolates", "toiletries"]
grocery_list.my_each_with_index {|grocery, index| p "Please get #{grocery}" if index.even?}
