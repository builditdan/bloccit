class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  has_many :labelings, as: :labelable

  has_many :labels, through: :labelings


  scope :publicly_viewable, -> {where(public: true) }
  scope :visible_to, -> (user) {user ? all : publicly_viewable }
  scope :privately_viewable, -> (user) {user ? where(public: false) : where(public: true) }

end
