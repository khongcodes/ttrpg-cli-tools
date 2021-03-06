class Printer
  
  def print_rolling(string = "1d6")
    puts "rolling #{string}"
  end

  def print_roll_outcomes(result_array)
    result_array.each_with_index do |obj, index|
      # mark selected numbers if flag
      if obj[:flag]
        flag_number = obj[:flag][1] || 1
        i = 0
        while i + 1 <= flag_number.to_i do 
          obj[:results][i] = "[#{obj[:results][i]}]"
          i+=1
        end
      end
      
      print obj[:results].join(", ")

      # if result_array has multiple items and this item is not the last one
      print "  /  " if index != result_array.length - 1
    end
    puts
  end

  def print_clause_result(result_string)
    print_marker
    puts result_string
  end

  def print_tarot(card_array)
    pluralized_cards_message(card_array.length, "tarot")
    puts

    card_array.each_with_index do |card, index|
      puts card["name"]
      puts "#{card["type"]} Arcana"
      puts "Suit: #{card["suit"]}"
      puts
      puts "Description: #{card["desc"]}"
      puts
      puts "Meaning (upright): #{card["meaning_up"]}"
      puts "Meaning (inverted): #{card["meaning_inv"]}"
      puts "\n-------------------------------\n\n" unless index == card_array.length - 1
    end
    
    puts
  end

  def print_playing_cards(card_array)
    pluralized_cards_message(card_array.length, "playing")
    puts
    card_array.each {|c| puts c}
    puts
  end

  private

  def pluralized_cards_message(card_array_length, type)
    pluralized_cards = card_array_length == 1 ? "card" : "cards"
    puts "#{card_array_length} #{type} #{pluralized_cards} drawn:"
  end

  def print_marker
    print "=> "
  end

end