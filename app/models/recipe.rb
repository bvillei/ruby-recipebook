class Recipe < ApplicationRecord
  has_one :attachment
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
end
