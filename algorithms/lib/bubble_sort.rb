class Array
  def bubble_sort(&prc)
    prc ||= Proc.new { |a, b| a <=> b }
    array = self

    is_sorted = false
    until is_sorted
      is_sorted = true

      array.count.times do |i|
        el1, el2 = array[i], array[i+1]
        break if i == array.count-1
        if prc.call(el1, el2) == 1
          is_sorted = false
          array[i], array[i+1] = array[i+1], array[i]
        end
      end
    end

    array
  end
end
