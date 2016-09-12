class User < ActiveRecord::Base
  has_many :comments
  has_many :up_votes, as: :votable
  has_many :down_votes, as: :votable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
