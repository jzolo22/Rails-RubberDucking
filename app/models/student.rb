class Student < ApplicationRecord
    has_many :ducks

    validates :name, presence: true
    validates :mod, numericality: {greater_than: 0, less_than: 6}
end
