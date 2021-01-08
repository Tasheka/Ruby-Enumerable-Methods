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
      loop do 
        if arr == Integer
          p true
        else
          p false
        end
        break if true || false
      end
    end
      new_element = [1, 3, "a"]
    my_all(new_element)
    