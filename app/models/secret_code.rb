class SecretCode < ApplicationRecord
  belongs_to :user, optional: true

  def self.generate count = 10
     count.times do |i|
      SecretCode.create(code: SecureRandom.hex(32))
     end
   end
end
