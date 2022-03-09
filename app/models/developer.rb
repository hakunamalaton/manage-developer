class Developer < ApplicationRecord
    has_and_belongs_to_many :programming_languages
    has_and_belongs_to_many :languages

    validates :email, presence: true, uniqueness: true
end
