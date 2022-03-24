require './lib/encryptor'

class User
  include Dynamoid::Document

  has_many :posts
  has_many :feedbacks, as: :source
  has_many :logins

  table name: :users, key: :user_id, read_capacity: 5, write_capacity: 5

  field :name
  field :email
  field :password
  field :password_confirmation

  validates_presence_of :email
  validates_presence_of :password, on: :create
  before_save :encrypt_password

  private

  def encrypt_password
    encrypted_password = Encryptor.new.encrypt(self.password)
    self.password = encrypted_password
    self.password_confirmation = encrypted_password
  end
end
