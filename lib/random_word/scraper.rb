class RandomWord::Scraper

  #a random word needs a random number
  def self.random_letter
    #letter = Random.new.rand(26)
    ('a'..'z').to_a.sample
  end

  #gets the main-letter page
  def self.url_letter
    letter = self.random_letter
    url = "https://www.merriam-webster.com/browse/dictionary/#{letter}"
  end

  #gets the sub-page for the letter
  def self.url_letter_subpage
    url = self.url_letter
    doc = Nokogiri::HTML(open(url))
    range = doc.search("div.p-wrap.p-wrap-bot.clearfix").css(".counters").text
    range = range.delete("page 1 of ").to_i
    num = (rand(1..range))
    url = url + "/#{num}"
  end

  def self.get_words
    url = self.url_letter_subpage
    doc = Nokogiri::HTML(open(url))
    puts url
    words = doc.search(".browse-words .entries ul li a")
    words_array = []
    words.each do |i|
      words_array << i.attribute("href").value
    end
    words_array
  end




end
