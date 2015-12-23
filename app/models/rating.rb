class Rating < ActiveRecord::Base
  belongs_to :topic
  belongs_to :post
  has_many :topics
  has_many :posts

  #before_save { self.severity ||= :PG }

  enum severity: [ :PG, :PG13, :R ]

  def self.update_rating(rating_string)

    if rating_string.blank?
      return nil
    else
      x = Rating.find_by severity: rating_string.to_i
      return x.id
    end

  end


end
