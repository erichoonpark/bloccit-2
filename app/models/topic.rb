class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :user

  validates :name, length: {minimum: 5}, presence: true

  scope :visible_to, -> (user) { user ? all : publicly_viewable }
  scope :publicly_viewable, -> { where(public: true) }
  scope :privately_viewable, -> { where(public: false) }


end
