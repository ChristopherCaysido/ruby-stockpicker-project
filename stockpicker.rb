# Array -> Array
# Stockpicker outputs a key pair array of the best day to buy and sell stock

# Template
# def stockpicker(array){
#   return Array.new
# }


# Two Value Pair Must Be Profitable
# Need to transform the array into hashes?


def stockpicker(stock_prices)
  combination_hash = combinations(stock_prices)
  stock_item = get_keys(combination_hash)
  get_index(stock_item)
end

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

def get_keys(stock_hash)
  keys = []  
  stock_hash.each do |key, value|
    keys.push(key)
  end
  stock_hash
  filtered_stock_prices = keys.reduce(Array.new) do |acc, key_stock_hash|
    acc.push(stock_hash[key_stock_hash][:prices])
    acc
  end
  max_value = filtered_stock_prices.max
  stock_item =  stock_hash.select do |key, value|
    stock_hash[key][:prices] == 12
  end 
  return stock_item
end

def get_index(stock_item)
  indices = stock_item.reduce do |item_index, (key, value)|
    p stock_item[key][:index]
    item_index.push(stock_item[key][:index])
    item_index
  end
  return indices
end

stock_prices = [17,3,6,9,15,8,6,1,10]

p stockpicker(stock_prices)
