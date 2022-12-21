class User < ApplicationRecord
  has_many :questions, dependent: :destroy

  has_secure_password

  before_validation :downcase_nickname, :downcase_email

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w\.-]+@[A-Za-z\d\-\.+]+\.[a-z]+\z/}
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A\w+\z/}
  validates :color, format: { with: /\A#[a-f\d]{6}\z/}

  private

  def downcase_nickname
    nickname.downcase!
  end

  def downcase_email
    nickname.downcase!
  end

  def to_param
    nickname
  end
end
