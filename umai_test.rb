Dir["model/*.rb"].each {|file| require file }
Dir["lib/*.rb"].each {|file| require file }
require 'json'

class UmaiTest

  def user_sign_up(name = '', email = '', password = '', password_confirmation = '')
    @user = User.new(name: name, email: email, password: password, password_confirmation: password_confirmation)
    @user.save!
    @user.to_json
  end

  def user_login(email: '', password: '')
    @user = User.find_by_email(email)
    if @user.password.eql? Encryptor.new.encrypt(password)
      @jwt_initializer = JwtAuthenticator.new(email, password)
      { jwt_token: @jwt_initializer.generate_token, status: 200 }.to_json
    else
      { error: 'Invalid email or password', status: 401 }.to_json
    end
    Login.create(ip: request.ip_address) if @user
  end

  def get_user_posts(jwt_token)
    data = decode_token(jwt_token)
    @user = find_user(data['email'])
    @user.posts.to_json
  end

  def user_ips(jwt_token)
    data = decode_token(jwt_token)
    @user = find_user(data['email'])
    { login_ips: @user.logins.pluck(:ip_address) }.to_json
  end


  private

  def decode_token(token)
    @email = JwtAuthenticator.decode_token(token)
  end

  def find_user(email)
    @user = User.find_by_email(email)
  end

end
