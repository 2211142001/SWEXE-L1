class Book < ApplicationRecord
    validates :title, presence: true, length: { maximum: 50 }
    validates :author, presence: true
    validates :isbn, format: /(?=(?:\D*\d){10}(?:(?:\D*\d){3})?$)[\d-]+/, allow_blank: false
end
