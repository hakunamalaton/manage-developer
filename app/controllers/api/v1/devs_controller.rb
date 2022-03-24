class Api::V1::DevsController < ApplicationController 
  before_action :set_developer, only: [:show]
  # rails cache
  def show
    # @developer.languages.pluck(:code) 
    # @languages = @developer.languages.pluck(:code)

    # @pro_lans = @developer.programming_languages.pluck(:name)

    # render json: {
    #   "developer" => {
    #       "id" => @developer.id,
    #       "email" => @developer.email
    #   },
    #   "languages" => languages,
    #   "programming_languages" => pro_lans
    # }
  end

  def get_all_details
    result = Developer.get_all
    result = result.map do |developer|
      {
        developer: Developer.where(id: developer[:developer]).pluck(:email)[0],
        programming_languages: ProgrammingLanguage.where(id: developer[:programming_languages]).pluck(:name),
        languages: Language.where(id: developer[:languages]).pluck(:code)
      }
    end

    render json: result
  end

  private

  def set_developer
    @developer = Developer.find_by(id: params[:id])
  end

end
