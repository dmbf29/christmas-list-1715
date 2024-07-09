require 'csv'

def display_list(list)
  list.each_with_index do |(item, bought), index|
    x_mark = bought ? 'X': ' '
    puts "#{index + 1} - [#{x_mark}] #{item}"
  end
end

def save_csv(list)
  filepath = 'lib/gifts.csv'
  CSV.open(filepath, 'wb') do |csv|
    csv << ['item', 'bought']
    list.each do |item, bought|
      csv << [item, bought]
    end
  end
  # open the CSV file
  # iterate over the list and put each item inside
end

def load_csv
  # any time we load the CSV, we need to convert non-string characters
  filepath = 'lib/gifts.csv'
  # start with empty list if no previous CSV
  return {} unless File.exist?(filepath)

  # open the CSV file
  christmas_list = {}
  # put each row from the csv into our list
  CSV.foreach(filepath, headers: :first_row, header_converters: :symbol) do |row|
    key = row[:item]
    value = row[:bought] == "true"
    christmas_list[key] = value
  end
  christmas_list
end
