class Array
  def merge_sort(&prc)
    return self if self.length <= 1

    prc ||= Proc.new { |a, b| a <=> b }

    half = self.count / 2
    left = self.take half
    right = self.drop half

    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private

    def self.merge(left, right, &prc)
      merged = []

      until left.empty? || right.empty?
        left_first = left.first
        right_first = right.first

        prc_res = prc.call(left_first, right_first)

        if prc_res == -1
          merged << left_first
          left.shift
        else
          merged << right_first
          right.shift
        end
      end

      merged + left + right
    end
end
