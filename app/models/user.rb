class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  validate :validate_employee_id
  attr_writer :login

  def validate_employee_id
    if User.where(email: employee_id).exists?
      errors.add(:employee_id, :invalid)
    end
  end

  def login
    @login || self.employee_id || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(employee_id) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:employee_id) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
