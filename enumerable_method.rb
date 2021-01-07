def my_each(arr)
    len = arr.length
    for name in arr do
        yield (name)
    end
end

names = ["Amy", "John", "Joe"]
my_each(names) {|a| puts "Hello #{a}"}