class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :sols_one, class_name: 'Sol', :foreign_key => 'user_one_id'
  has_many :sols_two, class_name: 'Sol', :foreign_key => 'user_two_id'
end
