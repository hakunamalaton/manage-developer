class Developer < ApplicationRecord
  has_and_belongs_to_many :programming_languages
  has_and_belongs_to_many :languages
  has_many :interviews

  def self.get_all
    Rails.cache.fetch("#{cache_versioning}/get_all",expires_in: 15.minutes) do
      developers = Developer.eager_load(:programming_languages, :languages)

      developers.map do |developer|
        {
            developer: developer.id,
            programming_languages: developer.programming_languages.pluck(:id),
            languages: developer.languages.pluck(:id)
        }
      end
    end
  end

  validates :email, presence: true, uniqueness: true
end
