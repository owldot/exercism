class HighScores
  attr_reader :scores

  def initialize(scores = [])
    @scores = Array(scores)
  end

  def latest
    @scores.last || 0
  end

  def personal_best
    @scores.max || 0
  end

  def personal_top_three
    @scores.sort { |a, b| b <=> a }.take(3)
  end

  def latest_is_personal_best?
    latest >= personal_best
  end
end