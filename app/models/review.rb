class Review < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user

  validates :comment, presence: true
=======
  belongs_to :flat
  belongs_to :user
>>>>>>> 9aed5e22cf29e7895c27ac4558d2a089b9b05003
end
