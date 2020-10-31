class Duck < ApplicationRecord
    belongs_to :student

    validates :name, :description, presence: true
end
