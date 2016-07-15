class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :up_votes, as: :votable


end
