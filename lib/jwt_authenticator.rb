require 'jwt'

class JwtAuthenticator

  ENV = YAML::load_file('config/application.yml')
  ENCRYPTION_ALGORITHM = 'HS256'

  def initialize(email = '', password = '')
    @email = email
    @password = password
  end

  def generate_token
    exp = Time.now.to_i + ENV['JWT_EXPIRATION_TIME'] * 3600
    payload = { email: @email, password: @password, expiry_time: exp }
    token = JWT.encode payload, ENV['HMAC_SECRET'], ENCRYPTION_ALGORITHM
  end

  def self.decode_token(token)
    JWT.decode token, ENV['HMAC_SECRET'], true, { algorithm: ENCRYPTION_ALGORITHM }
  end

end
