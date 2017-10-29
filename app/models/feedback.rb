class Feedback < ApplicationRecord
  validates :name, :email, :text, presence: true
end
