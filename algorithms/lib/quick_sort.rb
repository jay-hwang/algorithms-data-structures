require 'byebug'

class Array
  def quick_sort
    return self if self.length <= 1

    pivot_idx = rand(self.length)
    pivot = self[pivot_idx]
    split_idx = Array.partition(self, pivot_idx)

    left = self[0..split_idx]
    right = self[split_idx+1..-1]
    
    left.quick_sort + right.quick_sort
  end

  private
    def self.partition(array, pivot_idx)
      pivot = array[pivot_idx]

      idx = 0
      until idx >= array.length
        el = array[idx]

        if idx < pivot_idx && el > pivot
          array[idx] = array[pivot_idx-1]
          array[pivot_idx-1] = pivot
          array[pivot_idx] = el
          pivot_idx -= 1
          idx -= 1
        elsif idx > pivot_idx && el <= pivot
          array[idx] = array[pivot_idx+1]
          array[pivot_idx+1] = pivot
          array[pivot_idx] = el
          pivot_idx += 1
          idx -= 1
        end

        idx += 1
      end
      pivot_idx
    end
end
