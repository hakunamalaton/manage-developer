class DevelopersProgrammingLanguage < ApplicationRecord
  belongs_to :developer
  belongs_to :programming_language
end
