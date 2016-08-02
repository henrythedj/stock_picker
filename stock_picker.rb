puts "Welcome to Stock Picker!"
puts "What's your name?"
name = gets.chomp
puts "That actually doesn't matter"
puts "Let's move on"
#obtain the number of days tracked, up to 3 weeks (15 business days)
puts "How many days have you tracked this stock? (non-zero # less than 14, please)" #limited to 14 for ease of use, no problems with numbers greater than 14
puts "Note that 0 counts as a day, so if you enter '2', it will ask you for the price on day 0, 1, and 2"
days = gets.strip.to_i
	while days == 0 || days > 15
		puts "I asked for a non-zero number less than 14. Try again!"
		puts "How many days have you tracked this stock? (non-zero # less than 14, please)"
		days = gets.strip.to_i
	end
#obtain all the prices
n = 0
prices = []
while n <= days
	puts "What was the price on day #{n}?"
	price = gets.strip.to_i
		while price <= 0
			puts "That company went out of business?"
			puts "I don't know...are you sure the price was 0?"
			puts "Try again"
			puts "What was the price on day #{n}?"
			price = gets.strip.to_i
		end
	prices[n] = price
	n += 1
end

#find optimal buy/sell points
def stock_picker(price_array)
	m = 0
	j = 0
	most_profit = 0
	solution1 = 0
	solution2 = 0
	while m < price_array.length
		j = m + 1
		while j < price_array.length
			profit = price_array[m] - price_array[j]
			if profit < most_profit
				most_profit = profit
				solution1 = m
				solution2 = j
			end
			j += 1
		end
		m += 1
	end
	most_profit = most_profit*(-1)
	puts "The most profitable trade has been found"
	puts "Buy on Day #{solution1} (price: $#{price_array[solution1]}) and sell on Day #{solution2} (price: $#{price_array[solution2]}) for a profit of #{most_profit}"
	solution = [solution1, solution2, most_profit]
end

stock_picker(prices)