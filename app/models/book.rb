class Book < ApplicationRecord
  belongs_to :user
  validates :title, :opinion, presence: true

end