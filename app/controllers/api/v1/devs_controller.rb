class Api::V1::DevsController < ApplicationController 
  before_action :set_developer  

  def show
    language = @developer.languages.map do |lan|
        {
            "code" => lan.code
        }
    end

    pro_lan = @developer.programming_languages.map do |lan|
        {
            "name" => lan.name
        }
    end

    render json: {
        "developer" => {
            "id" => @developer.id,
            "email" => @developer.email
        },
        "languages" => language,
        "programming_languages" => pro_lan
    }
  end

  private

  def set_developer
    @developer = Developer.find_by(id: params[:id])
  end

end