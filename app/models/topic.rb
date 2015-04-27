class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :user

  validates :name, length: {minimum: 5}, presence: true
end
