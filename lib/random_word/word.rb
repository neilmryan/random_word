class RandomWord::Word

  attr_accessor :spelling, :kind, :definition, :history

  def initialize(spelling)
    @spelling = spelling
  end

  def self.easy
    word = RandomWord::Scraper.get_easy_word
    attributes = RandomWord::Scraper.get_word_attributes(word)
    word = self.new(word)
    word.kind = attributes[0]
    word.definition = attributes[1]
    word.history = attributes[2]
    word
  end

  def self.medium
    word = RandomWord::Scraper.get_medium_word
    attributes = RandomWord::Scraper.get_word_attributes(word)
    word = self.new(word)
    word.kind = attributes[0]
    word.definition = attributes[1]
    word.history = attributes[2]
    word
  end

  def self.hard
    word = RandomWord::Scraper.get_hard_word
    attributes = RandomWord::Scraper.get_word_attributes(word)
    word = self.new(word)
    word.kind = attributes[0]
    word.definition = attributes[1]
    word.history = attributes[2]
    word
  end

end
