def display_list(list)
  list.each_with_index do |(item, bought), index|
    x_mark = bought ? 'X': ' '
    puts "#{index + 1} - [#{x_mark}] #{item}"
  end
end

# Step 1 - JUST the menu loop
christmas_list = {
  # 'item' => bought
  'Mac Book' => false,
  'Car' => true
}

# display a welcome message to the user
puts "🎄Welcome to your Christmas List 🎄"
# initialize the variable choice (so that we can start the loop)
choice = nil
# Start the loop here (until the user chooses quit)
until choice == 'quit'
  # display the actions the the user
  puts "Which action [list|add|mark|idea|delete|quit]?"
  # get the user's choice in var 'choice' [list|add|delete|quit]
  choice = gets.chomp
  # conditon -> case statement
  # for each option, JUST have "puts" message
  case choice
  when 'list'
    display_list(christmas_list)
  when 'add'
    # ask user which gift they'd like to add
    puts "What item would you like to add?"
    # get the new item from the user (variable called item)
    item = gets.chomp
    # hash_name[key] = value (set it as false by default)
    christmas_list[item] = false
    # tell the use that the item was added to the list
    puts "#{item.capitalize} was added to the list!"
  when 'mark'
    # display the christmas list (using the method)
    display_list(christmas_list)
    # tell the user to choose a number to mark
    puts "Which one would you like mark as bought?"
    # get the user's index
    index = gets.chomp.to_i - 1
    # items = get all the items from the christmas_list (using .keys)
    items = christmas_list.keys
    # get the one item from the array using the index
    item = items[index]
    # update the christmas_list item to 'bought'
    # HASH READ -> hash_name[key]
    # HASH UPDATE -> hash_name[key] = new_value
    christmas_list[item] = !christmas_list[item]
    # tell the user the item was updated
    puts "#{item} was updated!"
  when 'idea'
    # ask the user what they are looking for
    # store the user's idea
    # call the method in the scraper, which should give us a hash of items
    # give the items to our display method
    # ask the user to pick a number
    # get all the items from the scraper list (using .keys)
    # get the one item using the index on the array
    # add the new item into the christmas list
    # tell the user the item was addded
  when 'delete'
    # display the christmas list (using the method)
    display_list(christmas_list)
    # tell the user to choose a number to delete
    puts "Which one would you like delete?"
    # get the user's index
    index = gets.chomp.to_i - 1
    # items = get all the items from the christmas_list (using .keys)
    items = christmas_list.keys
    # get the one item from the array using the index
    item = items[index]
    # remove the item from the hash using:
    # hash_name.delete(key)
    christmas_list.delete(item)
    # tell the user the item was removed
    puts "#{item} was removed from the list."
  when 'quit'
    puts "TODO: quit"
  else
    puts "Wrong action"
  end
end
# end the loop here

# Step 2a - Displaying the Christmas List
# Step 2b - Adding a gift to the Christmas List
