class Login
  include Dynamoid::Document

  belongs_to :user

  table name: :logins, key: :login_id, read_capacity: 5, write_capacity: 5

  field :ip_address

end
