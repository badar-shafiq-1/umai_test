# frozen_string_literal: true

class Encryptor

  delegate :encrypt_and_sign, :decrypt_and_verify, to: :encryptor

  def encrypt(value)
    encrypt_and_sign(value)
  end

  def decrypt(value)
    decrypt_and_verify(value)
  end

  private

  def encryptor
    ActiveSupport::MessageEncryptor.new(key)
  end

  def key
    ActiveSupport::KeyGenerator.new(encryption_key).generate_key(encryption_secret,
                                                                 ActiveSupport::MessageEncryptor.key_len)
  end

  def encryption_key
    return ENV["ENCRYPTION_KEY"]

    '0504a2386ee621fa52be71e0e4e63f30903c70ed8f331df3b9f4f990f40077c70fe5d47'\
    'c61b7ff2dcf3a3fc0db7f92550f9dbb64aa3f52f06fc7091928ea136a'
  end

  def encryption_secret
    return ENV["SECRET_KEY"]

    '16d8162e94825cbdb974758469ac2a2451f0105e674879d1629ae4ac26bc70e5c0cec841'\
    '5d8c5ecafae67c8b24629c254fa5b1229663bdb977f32ee8d000eebf'
  end
end
