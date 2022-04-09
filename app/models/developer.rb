class Developer < ApplicationRecord
  has_and_belongs_to_many :programming_languages
  has_and_belongs_to_many :languages
  has_many :interviews

  after_save :set_invalidate_caching, :clear_redis

  def self.get_all
    Rails.cache.fetch([self, :get_all], expires_in: 15.minutes) do
      # 
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
  
  private

  def set_invalidate_caching
    Rails.cache.delete([self, :get_all])
    return true
  end

  def clear_redis
    #p "Something????????????????????????"
    $redis.del "developers"
    return true
  end

  validates :email, presence: true, uniqueness: true
end
