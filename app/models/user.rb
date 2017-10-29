class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :secret_code, dependent: :destroy

  attr_accessor :secret_code

  validates :first_name, :last_name, presence: true

  after_create :check_secret_code

  def name
   	 "#{self.first_name} #{self.last_name}"
   end

  private
    def check_secret_code
      secret_code = SecretCode.find_by(code: self.secret_code) unless self.is_admin?
      secret_code.user = self
      secret_code.save
    end
end
