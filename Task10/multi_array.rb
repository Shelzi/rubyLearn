def iterate_multi_dimensional_array(array, memo = [])
  array.each do |element|
    if element.is_a?(Array)
      iterate_multi_dimensional_array(element, memo)
    else
      memo << element
    end
  end
  memo
end

input = [6, 7, 8, [5, 4,[9, 10],[12, 3]],[13, [104, 2], 20, 1]]
plain_array = iterate_multi_dimensional_array(input)
puts(plain_array.sort { |a, b| b <=> a })
