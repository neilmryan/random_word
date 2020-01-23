class RandomWord::Word

  attr_accessor :spelling, :length, :definition, :history

  def self.easy
    #bat
    # I should return a scraped word 5 or fewer letters
    #puts "Here is your easy word."
    word = self.new
    word.spelling = "bat"
    word.length = "bat".length
    word.definition = "a stout solid stick"
    word.history = "Middle English, from Old English batt"
    word
  end

  def self.medium
    #battle
    # I should return a scraped between 5 and 10 letters
    puts "Here is your medium word."
  end

  def self.hard
    #battalions
    # I should return a scraped word 10 or more letters
    puts "Here is your hard word."
  end

end
