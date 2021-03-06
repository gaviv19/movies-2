# February 9, 2015
# cosi 105b, prof. Pito Salas
# Author: Aviv Glick
#
# (PA) Movies Part 2
#
# This class performs statistical analisys on a list of all the results of run_text(k), where each resault is a tuple,
# containing the user, rated movie, rating and predicted rating.


class MovieTest

  attr_accessor :list

  def initialize(list)
    @list = list
  end

  # returns the average prediction error (which should be close to zero)
  def mean()
    diff = @list.collect {|item| item[:prediction] - item[:rating]}
    sum(diff) / diff.length
  end

  # returns the standard deviation of the prediction error
  def stddev()
    meanPredictionError = mean
    diffSquare = @list.collect {|item| ((item[:prediction] - item[:rating]) - meanPredictionError) ** 2}
    Math.sqrt(sum(diffSquare) / (diffSquare.length - 1))
  end

  # returns the root mean square error of the prediction
  def rms()
    diffSquare = @list.collect {|item| (item[:prediction] - item[:rating]) ** 2}
    Math.sqrt(sum(diffSquare) / diffSquare.length)
  end

  # return the sum of elements in an array
  def sum(arr)
    arr.inject(0.0) { |sum, el| sum + el.to_f }
  end

  # returns an array of the predictions in the form [user, movie, rating, predicted rating]
  def to_a()
    list.collect {|item| item.values_at 0, 1, 2, 3}
  end
  
end




