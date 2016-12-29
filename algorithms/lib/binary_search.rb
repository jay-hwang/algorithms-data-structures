class Array
  def binary_search(target)
    return nil if self.length <= 1 && self[0] != target

    half = self.count / 2
    mid = self[half]
    left = self.take half
    right = self.drop half

    return half if mid == target

    if target < mid
      left.binary_search(target)
    else
      right_res = right.binary_search(target)
      half + right_res unless right_res.nil?
    end
  end
end
