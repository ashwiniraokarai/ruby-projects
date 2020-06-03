# Build a method #bubble_sort that takes an array and returns a sorted array.
# It must use the bubble sort methodology (using #sort would be pretty pointless, wouldn’t it?).
# > bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]

# optimization one:
# at the end of every iteration you have one element that found its sorted position i.e., bubbled up to the right end
# so you have one less element to process in the following iteration

# optimization two:
# using a tracking variable, track any swaps in a full iteration
# at the end of an iteration, if tracking variable is still 0 it means there was not a single swap which mean array is already sorted
# so you can stop iterating further

def bubble_sort(array_to_sort)
  array_to_sort = [4,3,78,2,0,2]
  # at worst it takes n-1 iterations to sort n items
  number_of_iterations = array_to_sort.length - 1
  max = array_to_sort.length - 1

  number_of_iterations.times do
    #swap counter to track swap on every iteration. Reset to 0 at the beginning of every iteration.
    number_of_swaps = 0
    for index in 1..max
      if array_to_sort[index - 1] > array_to_sort[index]
         temp = array_to_sort[index]
         array_to_sort[index] = array_to_sort[index - 1]
         array_to_sort[index - 1] = temp
         #count the swap
         number_of_swaps += 1
      end
    end

    # optimization one
    max -= 1

    # optimization two
    if number_of_swaps == 0
      break
    end
  end
  return array_to_sort
end

array_to_sort = [4,3,78,2,0,2]
bubble_sort(array_to_sort)
