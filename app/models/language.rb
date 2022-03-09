class Language < ApplicationRecord
    has_and_belongs_to_many :developers

    validates :code, presence: true, uniqueness: true
end
