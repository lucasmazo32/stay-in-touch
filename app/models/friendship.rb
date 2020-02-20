class Friendship < ApplicationRecord
  belongs_to :friend, class_name: 'User'
  belongs_to :friended, class_name: 'User'
end
