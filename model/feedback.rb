class Feedback
  include Dynamoid::Document

  belongs_to :source, polymorphic: true, optional: true

  table name: :feedbacks, key: :source_ids, read_capacity: 5, write_capacity: 5

  field :comment
  field :author_ip
  field :owner_id, :integer

end
