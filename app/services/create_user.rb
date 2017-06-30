class CreateUser
  def self.perform(email:)
    User.create!(email: email, password: _random_password)
  end

  class << self
    private

    def _random_password
      SecureRandom.hex(30)
    end
  end
end
