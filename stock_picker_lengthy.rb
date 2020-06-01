# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
#
#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12
# Quick Tips:
#
# You need to buy before you can sell
# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

#NOTE: This is a lengthy version (unnecessarily). Refer to the shorter, simpler and more efficient version I rewrote.
def stock_picker(stock_prices)
 limit = stock_prices.length
 results = []
 best_buy, best_sell, highest_profit = 0
 index_of_result, overall_highest_profit, overall_best_buy, overall_best_sell = 0

 #logic: given an element in the array (buy), subtract it from each element that appears after it (every sell) to get a set of profits. Get the highest profit.
 #do this for every element in the array starting with the first thro last element. This yields a list of highest profits, with every item being a result from each iteration
 #compare within list of highest profits to get the overall highest profit
 #finally, get the indices (days) of best-buy and best-sell based off of the overall highest profit

 stock_prices.each_index do |index_of_buy|
   best_buy = index_of_buy
   index_of_sell = index_of_buy + 1

   if index_of_buy == limit - 1
     #return sell day same as buy day if last element in array coz nothing left to compare with
     index_of_sell = index_of_buy
     highest_profit = stock_prices[index_of_sell] - stock_prices[index_of_buy]
     best_sell = index_of_sell
   else
     #assume highest profit and best sell
     highest_profit = stock_prices[index_of_sell] - stock_prices[index_of_buy]
     best_sell = index_of_sell
     index_of_sell = index_of_buy + index_of_sell
   end

   while (index_of_sell) < limit
     #keep subtracting buy with each sell in the array (i.e, each element that appears after the buy) and compare the difference with previous difference to get the highest profit
     profit = stock_prices[index_of_sell] - stock_prices[index_of_buy]
     if profit > highest_profit
       highest_profit = profit #you have a new high
       best_sell = index_of_sell
     end
     index_of_sell += 1
   end

   #store the highest profit for the current buy in the loop
   results << {highest_profit: highest_profit}
   results.last[:best_buy] = best_buy
   results.last[:best_sell] = best_sell
 end

 #assume the first highest profit in the results array as the overall highest profit. Compare this with rest of the highest profits to get actual overall highest profit
 overall_highest_profit = results[0][:highest_profit]

 while (index_of_result < results.length)
   if (results[index_of_result][:highest_profit] > overall_highest_profit)
     overall_highest_profit = results[index_of_result][:highest_profit]
     overall_best_buy = results[index_of_result][:best_buy]
     overall_best_sell = results[index_of_result][:best_sell]
   end
   index_of_result += 1
 end

 p "......results........"
 p "buy the stock on day #{overall_best_buy}"
 p "sell on day #{overall_best_sell}"
 p "to gain the maximum profit which is #{overall_highest_profit}:"
 [overall_best_buy, overall_best_sell]
end

stock_prices = [17,3,6,9,15,8,6,1,10]
stock_picker(stock_prices)
