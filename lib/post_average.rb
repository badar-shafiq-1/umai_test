class PostAverage
  def self.calculate_average(values = [])
    (values.sum.to_f / values.length).round
  end
end
