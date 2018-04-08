class User < ApplicationRecord
  attr_accessor :password
  has_many :owned_recipes, class_name: "Recipe", foreign_key: 'user_id'
  has_and_belongs_to_many :recipes

  before_save :encrypt_password
  validates :email, {
      presence: true,
      uniqueness: true
  }
  validates :name, presence: true
  validates :password, confirmation: true, if: :password_required?

  def self.encrypt(salt, pass)
    Digest::SHA1.hexdigest(salt + pass)
  end

  def encrypt_password
    return if password.blank?
    if self.new_record?
      self.salt = SecureRandom.base64(8)
    end
    self.encrypted_password = User.encrypt(self.salt, self.password)
  end

  def self.authenticate(email, pass)
    user = User.where(email: email).first
    user && user.authenticated?(pass) ? user : nil
  end

  def authenticated?(pass)
    self.encrypted_password == User.encrypt(self.salt, pass)
  end

  def password_required?
    self.new_record? || !self.password.blank?
  end
end
