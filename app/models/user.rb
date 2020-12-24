class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_secure_password

  has_many :articles, ->{ includes(:author) }, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :password, presence: true, length: { minimum: 6, maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
end
