class Article < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :user_id

  validates :content, presence: true, length: { maximum: 140 }

  delegate :name, to: :author, prefix: true, allow_nil: true
end
