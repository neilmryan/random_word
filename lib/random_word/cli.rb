class RandomWord::CLI

  def call
    puts 'Welcome to Random Word!'
    level
  end

  def level
    puts 'What difficulty level of word would you like?:'
    puts '(Type "e" (easy), "m" (medium) or "h" (hard))'
    puts 'To exit type "quit"'
    input = gets.strip.downcase
    case input

    when "e"
      easy
    when "m"
      medium
    when "h"
      hard
    when "quit"
      exit!
    else
      puts 'I do not understand your entry!'
      level
    end

  end

  def easy
    @word = RandomWord::Word.easy
    puts "Your easy word is #{@word.spelling.capitalize()}."
    details?
    level
  end

  def medium
    @word = RandomWord::Word.medium
    puts "Your medium word is #{@word.spelling.capitalize()}."
    details?
    level
  end

  def hard
    @word = RandomWord::Word.hard
    puts "Your hard word is #{@word.spelling.capitalize()}."
    details?
    level
  end

  def details?
    puts "Would you like the definition and other details? (y/n)"
    input = gets.strip.downcase

    if input == "y"
      puts "The word #{@word.spelling.capitalize()} is of type: #{@word.kind}, and is #{@word.spelling.length} letters long."
      puts "The definition/s of #{@word.spelling}: #{@word.definition}."
      puts "Synonyms for #{@word.spelling.capitalize()} may be found here: #{@word.synonyms}."
    elsif input == "n"
      call
    end
    level
  end

end
