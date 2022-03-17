class Api::V1::DevsController < ApplicationController 
  before_action :set_developer, only: [:show]
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
    }
  end

  def get_all_details
    render json: Developer.get_all
  end

  private

  def set_developer
    @developer = Developer.find_by(id: params[:id])
  end

end
