require_relative 'scraper'
require_relative 'methods'

christmas_list = load_csv

puts "🎄Welcome to your Christmas List 🎄"
choice = nil
until choice == 'quit'
  puts "Which action [list|add|mark|idea|delete|quit]?"
  choice = gets.chomp
  case choice
  when 'list'
    display_list(christmas_list)
  when 'add'
    puts "What item would you like to add?"
    item = gets.chomp
    christmas_list[item] = false
    puts "#{item.capitalize} was added to the list!"
    save_csv(christmas_list)
  when 'mark'
    display_list(christmas_list)
    puts "Which one would you like mark as bought?"
    index = gets.chomp.to_i - 1
    items = christmas_list.keys
    item = items[index]
    christmas_list[item] = !christmas_list[item]
    puts "#{item} was updated!"
    save_csv(christmas_list)
  when 'idea'
    # ask the user what they are looking for
    puts "What are you looking for on MadeMe?"
    # store the user's idea
    idea = gets.chomp
    # call the method in the scraper, which should give us a hash of items
    mademe_items = scrape_mademe(idea)
    # give the items to our display method
    display_list(mademe_items)
    # ask the user to pick a number
    puts 'Pick one to add to your list (give the number)'
    index = gets.chomp.to_i - 1
    # get all the items from the scraper list (using .keys)
    items = mademe_items.keys
    # get the one item using the index on the array
    item = items[index]
    # add the new item into the christmas list
    christmas_list[item] = false
    # tell the user the item was addded
    puts "#{item} was added to your list!"
    save_csv(christmas_list)
  when 'delete'
    display_list(christmas_list)
    puts "Which one would you like delete?"
    index = gets.chomp.to_i - 1
    items = christmas_list.keys
    item = items[index]
    christmas_list.delete(item)
    puts "#{item} was removed from the list."
    save_csv(christmas_list)
  when 'quit'
    save_csv(christmas_list)
  else
    puts "Wrong action"
  end
end
