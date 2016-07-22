class Account < ActiveRecord::Base
  has_one :cart
  belongs_to :user

  has_many :friendships
  has_many :friends, through: :friendships

  validates :name, presence: true, length: { minimum: 5 }
  validates :name, format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i }
  validates :age, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  validates :age, numericality: { less_than_or_equal_to: 100 }
end
