require "./enumerable_method"

#Example for the my_each method
names = ["Amy", "John", "Joe"]
names.my_each {|name| p "Hello #{name}"}
