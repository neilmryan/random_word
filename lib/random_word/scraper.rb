class RandomWord::Scraper

  #a random word needs a random number
  def self.random_letter
    #letter = Random.new.rand(26)
    ('a'..'z').to_a.sample
  end

  def self.random_number_for_letter_index_and_new_url
    url = self.get_url_to_scrape_letter
    doc = Nokogiri::HTML(open(url))
    range = doc.search("div.p-wrap.p-wrap-bot.clearfix").css(".counters").text
    range = range.delete("page 1 of ").to_i
    url = url + "/#{range}"
  end

  def self.get_url_to_scrape_letter
    letter = self.random_letter
    url = "https://www.merriam-webster.com/browse/dictionary/#{letter}"
  end

end
