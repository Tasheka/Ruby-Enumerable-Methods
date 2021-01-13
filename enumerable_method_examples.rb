# Examples
require './enumerable_method'

# Example for the my_each method
names = %w[ 'Amy', 'John', 'Joe' ]
names.my_each { |name| p "Hello #{name}" }

# Example for the my_each_with_index method
grocery_list = %w[ 'bananas', 'plums', 'chocolates', 'toiletries' ]
grocery_list.my_each_with_index { |grocery, index| p "Please get #{grocery}" if index.even?}

# Example for the my_select method
letters = ['a', 'b', 'c', 3]
letters.my_select { |letter| letter.is_a? String}

# Example for the my_all method
numbers = [9, 10, 12, 20]
numbers.my_all? { |number| number.is_a? Integer }

# Example for the my_any method
numbers  = [9, 10, 12, 'Tasheka', 'lilo']
numbers.my_any? { |number| number.is_a? Integer }

# Example for the my_none method
words = %w['Tasheka', 'lilo', 'cat']
words.my_none? { |number| number.is_a? Integer }

# Example for the my_count method
new_letters = %w['a', 'g', 'h', 'i']
new_letters.my_map  {|letter| letter.upcase}
elements = [1, 2, 3, 4]
elements.my_map { |i| i * i }

# Example for the my_map method
new_letters = %w['a', 'g', 'h', 'i']
new_letters.my_map{ | letter | letter.upcase }

elements = %w['a', 'b', 'c']
elements.my_map proc{|value| value.upcase}
