require 'quick_sort'

describe "Quick Sort" do
  describe "partition" do
    it "partitions the whole array properly" do
      arr = [3, 1, 5, 2, 4]
      pivot_idx = Array.partition(arr, 0)

      expect(arr).to eq([1, 2, 3, 5, 4])
      expect(pivot_idx).to eq(2)
    end

    it "partitions a portion of the array" do
      arr = [4, 3, 2, 1, 7, 5, 8, 6]
      pivot_idx = Array.partition(arr, 4)
      expect(arr).to eq([4, 3, 2, 1, 5, 6, 7, 8])
      expect(pivot_idx).to eq(6)
    end
  end

  describe '#quick_sort' do
    let(:array) { [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] }

    it 'sorts numbers' do
      10.times do
        expect(array.shuffle.quick_sort).to eq ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
      end
    end
  end

end
