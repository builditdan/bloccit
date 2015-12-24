class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  after_create :create_vote

  has_many :comments, dependent: :destroy

  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings
  has_many :votes, dependent: :destroy

  default_scope {order('rank DESC')}

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
    new_rank = points + age_in_days
    update_attribute(:rank, new_rank)
  end

private

  def create_vote
    # why can't I access current_user.id, or @post,
    # or params.. had to use self
    # how I catch errors if the create fails? flash below does not work
    # this works as well --> new_vote = user.votes.create(value: 1, user_id: self.user_id, post_id: self.id)
    new_vote = user.votes.create(value: 1, post: self)
#    if new_vote == nil
#     flash.now[:alert] = "There was an error saving the vote. Please vote manually."
#    end
  end


end
