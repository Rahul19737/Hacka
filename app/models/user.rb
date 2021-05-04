class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :create_challenge
  has_many :vote
  validate :validate_user_id
  attr_writer :login

  def validate_user_id
    if User.where(email: user_id).exists?
      errors.add(:user_id, :invalid)
    end
  end

  def login
    @login || self.user_id || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(user_id) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:user_id) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
