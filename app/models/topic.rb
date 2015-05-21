class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :user

  validates :name, length: {minimum: 5}, presence: true

  scope :visible_to, -> { publicly_viewable(user) }

  def publicly_viewable(user)
    if user
      topic_collection.all
    else
      topic_collection.where(public: true)
    end
  end

  def privately_viewable
    topic_collection.where(public: false)
  end
end
