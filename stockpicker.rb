# Array -> Array
# Stockpicker outputs a key pair array of the best day to buy and sell stock

# Template
# def stockpicker(array){
#   return Array.new
# }

def stockpicker(stock_prices)
  # Initialize the best days arrat
  best_days = Array.new
  # Check which day is the lowest
  lowest_day = get_lowest_day(stock_prices)
end

def get_lowest_day(stock_prices)
  value = stock_prices.reduce do |lowest_value, stock_price|
    if stock_price < lowest_value
      lowest_value = stock_price
    else
      lowest_value = lowest_value
    end
    lowest_value
  end

  # Get index
  stock_prices.find_index(value)
end

stock_prices = [17,3,6,9,15,8,6,1,10]

stockpicker(stock_prices)