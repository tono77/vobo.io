class Sol < ApplicationRecord
	belongs_to :user_one, class_name: 'User'
	belongs_to :user_two, class_name: 'User'
  belongs_to :state
  has_many :sol_tags
  has_many :logs
  has_many :tags, through: :sol_tags
  has_many :comments

end
