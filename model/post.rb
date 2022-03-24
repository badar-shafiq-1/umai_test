class Post
  include Dynamoid::Document

  belongs_to :user
  has_many :rates
  has_many :feedbacks, as: :source

  table name: :posts, key: :post_id, read_capacity: 5, write_capacity: 5

  field :title
  field :content
  field :author_ip
  field :average, :integer, default: 0

  validates_presence_of :content
end
