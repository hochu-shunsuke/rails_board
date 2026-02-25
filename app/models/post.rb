class Post < ApplicationRecord
    has_one_attached :image
    has_many :comments, dependent: :destroy
    belongs_to :user

    validates :title, presence: true, length: { maximum: 50 }
    validates :content, presence: true
end
