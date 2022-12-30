class User < ApplicationRecord
    has_secure_password
    has_one_time_password column_name: :otp_secret_key, length: 4

    def welcome
      "Hello, #{self.email}!"
    end
end
