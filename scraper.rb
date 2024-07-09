# lib/scraper.rb
require 'nokogiri'
require 'open-uri'

def scrape_mademe(query)
  html_content = URI.open("https://mademe.co.uk/?s=#{query}&post_type=product").read

  # 2. We build a Nokogiri document from this file
  doc = Nokogiri::HTML.parse(html_content)

  # 3 Create an empty hash to store our scraped items
  scraped_items = {}
  # 4. We search for the correct elements containing the items' title in our HTML doc
  doc.search('.product-title').to_a.sample(5).each do |element|
    # 5. For each item found, we extract its title and print it
    # eventually, we'll want to take this item and add it into a hash
    scraped_items[element.text] = false
  end
  # what should we be returning?
  scraped_items
end

# Calling the method so we can test it.
# !!! Eventually we'll want to call this method in our interface !!!
# p scrape_mademe('pillow')
