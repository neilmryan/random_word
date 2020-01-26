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

  # 5 or fewer letters
  def self.get_easy_word
    easy_words = []
    self.get_words.each do |i|
      if i.length <= 17
      easy_words << i
      end
    end
    easy_words.sample
  end

  # 10 or fewer letters
  def self.get_medium_word
    medium_words = []
    self.get_words.each do |i|
      if i.length.between?(18, 22)
      medium_words << i
      end
    end
    medium_words.sample
  end

  # Greater than 10 letters
  def self.get_hard_word
    hard_words = []
    self.get_words.each do |i|
      if i.length > 22
      hard_words << i
      end
    end
    hard_words.sample
  end

end
