require 'pry'
class Sum
  def self.two_sums(nums, target)
    if nums.size < 2
      return []
    end

    result = []

    nums.each_with_index do |num1, index1|
      nums[(index1 + 1)..nums.size].each_with_index do |num2, index2|
        if num1 + num2 == target
          result = [index1, index2 + index1 + 1]
          break
        end
      end
      result.size == 2 && break
    end

    result
  end

  def self.two_sums_caching(nums, target)
    hash = {}

    nums.each_with_index do |number, index|
      if hash.key?(number)
        return [hash[number], index]
      else
        hash[target - number] = index
      end
    end

    []
  end
end
