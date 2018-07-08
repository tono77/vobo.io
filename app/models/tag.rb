class Tag < ApplicationRecord
	has_many :sol_tags, through: :sol_tags
end
