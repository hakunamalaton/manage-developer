class Developer < ApplicationRecord
  has_and_belongs_to_many :programming_languages
  has_and_belongs_to_many :languages
  has_many :interviews

  def self.get_all
    Rails.cache.fetch("developers",expires_in: 12.hours) do
      result = []
      developers = Developer.eager_load(:programming_languages, :languages)

      developers.each do |developer|
        detail_info = {
            developer: developer.email,
            programming_languages: developer.programming_languages.pluck(:name),
            languages: developer.languages.pluck(:code)
        }
        result += [detail_info]
      end
      result
    end
  end

  validates :email, presence: true, uniqueness: true
end
