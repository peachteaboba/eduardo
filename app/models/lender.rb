class Lender < ActiveRecord::Base
  has_secure_password
  has_many :logs, dependent: :destroy
  has_many :borrowers, through: :logs, source: :borrower

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :money, presence: true
end
