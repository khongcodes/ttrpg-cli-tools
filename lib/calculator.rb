class Calculator

  def roll(number = 1, dice = 6)
    result = []
    
    number.times do
      dice_result = rand(1..dice)
      result.push(dice_result)
    end


    # if minus came before this, make reduction value negative
    return {
      results: result,
      reduction: result.sum
    }
  end

  def calculate(clause_array)
    # add reduction results from each dice
    return clause_array.map {|c|c[:reduction]}.sum
  end
# 
end