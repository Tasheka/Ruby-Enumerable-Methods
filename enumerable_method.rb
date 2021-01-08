public def my_each(arr)

    for name in arr do

        yield (name)

    end

end



names = ["Amy", "John", "Joe"]

my_each(names) {|a| puts "Hello #{a}"}



def my_each_with_index(arr)

    len = arr.length

    i = 1

    for item in arr do

        if i <= len

            if i.even?

                yield (item)

            end

        end

        i += 1

    end

end



grocery_list = ["banana", "plum", "chocolate", "toiletries"]

my_each_with_index(grocery_list) {|m| puts "Please get #{m}"}



def my_select(arr)
new_array = []
  len = arr.length

  arr.my_each(arr) do |arr|

    if arr != 0..9
    new_array.push[arr]
    end
  end
end
  new_list = ["a", "b", "c", 3]

my_select(new_list) {|m| puts "hello #{m}"}

