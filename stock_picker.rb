# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
#
#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12
# Quick Tips:
#
# You need to buy before you can sell
# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

def stock_picker(stock_prices)
  highest_profit = stock_prices[0] - stock_prices[0]
  best_buy_day = best_sell_day = 0

  stock_prices.each_index do |index_of_buy_element|
    index_of_sell_element = index_of_buy_element + 1

    #when processing the last element in the array
    if index_of_buy_element == stock_prices.length - 1
      index_of_sell_element = index_of_buy_element
    end

    for index_of_sell_element in index_of_buy_element + 1..stock_prices.length - 1
      profit = stock_prices[index_of_sell_element] - stock_prices[index_of_buy_element]
      if profit > highest_profit
        highest_profit = profit
        best_buy_day = index_of_buy_element
        best_sell_day = index_of_sell_element
      end
      index_of_sell_element += 1
    end
  end

  p "buy on day #{best_buy_day} and sell on day #{best_sell_day} to gain the maximum profit of #{highest_profit}"
  return [best_buy_day, best_sell_day]
end

stock_prices = [17,3,6,9,15,8,6,1,10]
stock_picker(stock_prices)
