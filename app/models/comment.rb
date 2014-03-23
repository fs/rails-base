class Comment < ActiveRecord::Base
  validates :text, :title, presence: true
  belongs_to :post
end
