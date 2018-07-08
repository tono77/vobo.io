class Sol < ApplicationRecord
	belongs_to :applicant, :class_name => 'User'
	belongs_to :approver, :class_name => 'User'
  belongs_to :state
  has_many :sol_tags
  has_many :logs
  has_many :tags, through: :sol_tags
end
