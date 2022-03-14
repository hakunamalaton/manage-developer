class Api::V1::DevsController < ApplicationController 
  before_action :set_developer  
  # rails cache
  def show
    # @developer.languages.pluck(:code) 
    languages = @developer.languages.pluck(:code)

    pro_lans = @developer.programming_languages.pluck(:name)

    render json: {
      "developer" => {
          "id" => @developer.id,
          "email" => @developer.email
      },
      "languages" => languages,
      "programming_languages" => pro_lans
    }, cached: true
  end

  def get_all
    all_developers = Developer.all
    result = [] 
    all_developers.each do |developer|
      cache developer do
        languages = developer.languages.pluck(:code)
        pro_lans = developer.programming_languages.pluck(:name)
        result += [{
          "developer" => {
            "id" => developer.id,
            "email" => developer.email
        },
        "languages" => languages,
        "programming_languages" => pro_lans
        }]
      end
    end
    render json: {
      "data" => result
    }
  end

  private

  def set_developer
    @developer = Developer.find_by(id: params[:id])
  end

end
