class Contact < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true
  validates :email, presence: true, length: {maximum:255}
  validates :message, presence: true
end
