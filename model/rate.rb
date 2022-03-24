class Rate
  include Dynamoid::Document
  after_save :update_post_average

  belongs_to :post

  table name: :rates, key: :rate_id, read_capacity: 5, write_capacity: 5

  field :value, :integer, default: 0
  field :average_rating, :integer

  validates :value, presence: :true, inclusion: { in: (1..5) }

  private

  def update_post_average
    post = self.post
    average_rate = PostAverage.calculate_average(post.rates.pluck(:value))
    post.update(average_rating: average_rate)
  end
end
