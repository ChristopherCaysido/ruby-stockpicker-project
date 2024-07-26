def stockpicker(stock_prices)
  combination_hash = combinations(stock_prices)
  best_stock = get_stocks(combination_hash,stock_prices)
  get_index(best_stock,stock_prices)
end

def combinations(stock_prices)
  # Create a new hash to store the combination of numbers 
  # Iterate over the stock prices over combinations of two
  stock_prices.combination(2) 
end

def get_stocks(combinations,stock_prices)
  filtered = combinations.select {|item| item[0] < item[1]} # Select Combinations Where the Buy Prices is Lower than the Sell Price
  # Select combinations where the index of the second item must be higher than the index of the first item
  filtered = filtered.select {|item| stock_prices.find_index(item[1]) > stock_prices.find_index(item[0])} 
  # Select combinations where the profit is positive
  filtered = filtered.select {|item| (item[1]-item[0]).positive?}
  values_map = filtered.map {|item| item[1]-item[0]}
  values_map_max = values_map.max
  filtered = filtered.select {|item| (item[1]-item[0]) == values_map_max}
  filtered = filtered.flatten
end

def get_index(best_stock,stock_prices)
  index = best_stock.reduce(Array.new) do |indices, stock|
    indices.push(stock_prices.find_index(stock))
    indices
  end
  index
  debugger
end


stockpicker([17,3,6,9,15,8,6,1,10])