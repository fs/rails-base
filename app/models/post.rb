class Post < ActiveRecord::Base
  validates :title, :content, presence: true
  has_many :comments, dependent: :destroy
end
