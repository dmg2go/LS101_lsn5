# => RB101 Programming Foundations
# => Lesson 5 Ruby Collectons
# => Febuary 4-5, 2019
# => David George 
# => dmg2go@gmail.com

require 'pry';
# => Practice Problems: Sorting, Nested Collections and Working with Blocks

puts "\n\nPP1"
# => PP1
arr = ['10', '11', '9', '7', '8']
new_ary = arr.sort {|a,b| b.to_i <=> a.to_i}
p new_ary


puts "\n\nPP2"
# => PP2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]# mine
p books.sort {|a, b| a[:published].to_i <=> b[:published].to_i }
# theres
p books.sort_by {|book| book[:published].to_i}


puts "\n\nPP3"
# => PP3
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p "arr1 has a #{arr1[2][1][3]}"

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p "arr2 has a #{arr2[1][:third][0]}"

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p "arr3 has a #{arr3[2][:third][0][0]}"

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p "hsh1 has a #{hsh1['b'][1]}"

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p "hsh2 has a #{hsh2[:third].key(0)}"


puts "\n\nPP4"
# => PP4
puts "\nPP4\n"
arr1 = [1, [2, 3], 4]
rtrn = arr1.map do |e|
  if e.instance_of?(Array)
    e.map! do |e1| 
      if e1.instance_of?(Integer) && e1 == 3
        p "e1 is #{e1}  here line 54"
        e1 = 4
        p "e1 is #{e1}  here line 56"
        e1
      else
        p "e1 is #{e1} here line 57"
        e1
      end
    end
  end

  if e.instance_of?(Integer) && e == 3
    e = 4
  else
    e
  end
end
p rtrn

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p "arr1 is #{arr1}"

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p arr2


hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p hsh1


hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p hsh2

puts "\n\nPP5"
# => PP5
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

age_sum = 0
male_munsters = munsters.select do |k, v|
  age_sum += v["age"] if v["gender"] == "male"
end
p male_munsters
p age_sum
puts "\n\n"

age_sum = 0
male_munsters = munsters.select do |k, v|
  if v["gender"] == "male"
    age_sum += v["age"]
  end
end
p male_munsters
p age_sum


puts "\n\nPP6"
# => PP6
munsters.each_pair {|k, v| puts "#{k} is a #{v["age"]}-year-old #{v["gender"]}.\n"}


puts "\n\nPP7"
# => PP7
# 
a = 2
b = [5, 8]
arr = [a, b]
# ln 133 modifies the aray arr[0], not var a - a is still 2
arr[0] += 2
# ln 135 modifies array b, a nested array in arr
arr[1][0] -= a
p arr # arr => [4, [3, 8]]


puts "\n\nPP8"
# => PP8
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, string_array|
  string_array.each {|s| p s.scan(/[aeiou]/)}
end


puts "\n\nPP9"
# => PP9
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr_srtd = arr.map do |e|
  e.sort {|e1, g1| g1 <=> e1}
end
p arr_srtd


puts "\n\nPP10"
# => PP10
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr.map do |h| 
  new_h = {}
  h.each {|key, num| new_h[key] = num + 1 }
  p new_h
  new_h
end

p arr
p arr2


puts "\n\nPP11"
# => PP11

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
new_arr = arr.map do |e1|
  e1.select {|e2| e2 % 3 == 0 }
end
p arr
p new_arr


puts "\n\nPP12"
# => PP12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
h = {}

arr.each do |sub_array|
  h.store(sub_array[0], sub_array[1])
  #arr1.push h
end

p arr

puts "\nactual hash built"
p h

puts "\nusing each_with_object"
arr2 = arr.each_with_object({}) do |sub_array, memo|
  memo[sub_array[0]] = sub_array[1]
end
p arr2


puts "\n\nPP13"
# => PP13

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
arr1 = arr.sort do |a, b|
  a.select {|aa| aa.odd?} <=> b.select{|bb| bb.odd?}
end

p arr
p arr1


puts "\n\nPP14"
# => PP14

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr =[]
hsh.select do |_, v|
  case v[:type]
  when 'fruit'
    arr << v[:colors].map {|c| c.capitalize}
  when 'vegetable'
    arr << v[:size].upcase
  end
end
p arr

puts "\n\nPP15"
# => PP15
=begin
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

a = arr.each do |h|
  h.select! {|_, v| v.all? {|i| i.even? } }
end
p arr
a.reject! {|h| h.empty?}
p a

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
a = (arr.each {|h| h.select! {|_, v| v.all? {|i| i.even? } }}).reject{|e| e.empty?}
p a
=end

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
arr2 = arr.each_with_object([]) do |element_hash, array_out|
  selected_hash = Hash.new
  element_hash.select do |key, val|
    if val.all? {|i| i.even? }
      selected_hash.store(key, val) 
    end
  end

  unless selected_hash.empty?
    array_out << selected_hash
  end
end
p arr2
p arr

# => LS solution - I misunderstood the requirements.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
a = arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end
p arr
p a


puts "\n\nPP16"
# => PP16

require 'securerandom'

def build_uuid
  SecureRandom.uuid
end

p build_uuid







