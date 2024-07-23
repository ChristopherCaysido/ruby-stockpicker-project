# Array -> Array
# Stockpicker outputs a key pair array of the best day to buy and sell stock

# Template
# def stockpicker(array){
#   return Array.new
# }


# Two Value Pair Must Be Profitable
# Need to transform the array into hashes?


# def stockpicker(stock_prices)
  
# end

def combinations(stock_prices)
  # Create a new hash to store the combination of numbers 
  hash = Hash.new
  # Iterate over the stock prices over combinations of two
  stock_prices.combination(2) do |combination| 
    # Unless the the value of the sell stockprice is less than buy stock price 
    # and the index of combination
    unless combination[1] < combination[0] && stock_prices.find_index(combination[1]) > stock_prices.find_index(combination[0]) 
      hash[combination] = {index:[stock_prices.find_index(combination[0]),stock_prices.find_index(combination[1])]}
      hash[combination][:prices] = combination[1] - combination[0]
    else 
      next
    end
  end
  hash
end

stock_prices = [17,3,6,9,15,8,6,1,10]

puts combinations(stock_prices)
