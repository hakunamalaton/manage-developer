class DevelopersController < ApplicationController
  @@sort_interview = nil

  def index
    @developers = Developer.all
  end

  def new
  end

  def increase
    @@sort_interview = Developer.find_by(id: params[:id]).interviews.order(:score)
    # handle id errors
    redirect_to "/edit/#{params[:id]}"
  end

  def descrease
    @@sort_interview = Developer.find_by(id: params[:id]).interviews.order(score: :desc)
    redirect_to "/edit/#{params[:id]}"
  end

  def edit
    @init = "Sorting by ..."
    @edit_dev = Developer.find_by(id: params[:id])
    @sort_interview = nil
    if @@sort_interview
      @sort_interview = @@sort_interview
      @@sort_interview = nil
    end
    @interview = Interview.new
  end

  def createinterview
    dev = Developer.find_by(id: params[:id])
    dev.interviews.create(interview_params)
    
    redirect_to "/edit/#{params[:id]}"
  end

  def destroy_interview
    des_interview = Interview.find_by(id: params[:iid])
    des_interview.destroy!

    redirect_to "/edit/#{params[:id]}"
  end

  def get
    search_dev_name = []
    search_dev_code = []
    @@dev = []
    if params[:name].length > 0
      programming_lan = params[:name].split(",").map(&:strip).map(&:downcase).map(&:capitalize)
      # params[:name].split(",").map do |language|
      #   language.downcase.capitalize
      # end
      programming_lan.each do |lan|
        if ProgrammingLanguage.find_by(name: lan) 
          if search_dev_name.empty?
            search_dev_name = ProgrammingLanguage.find_by(name: lan).developers.to_a
            # .where
          else
            search_dev_name = search_dev_name.intersection(ProgrammingLanguage.find_by(name: lan).developers.to_a)
          end
        else
          # no result
          @@dev = []
          redirect_to result_path and return
        end
      end

      @@dev = search_dev_name
    end
    
    if params[:code].length > 0
      languages = params[:code].split(",").map(&:strip).map(&:downcase)

      languages.each do |lan|
        if Language.find_by(code: lan) 
          if search_dev_code.empty?
            search_dev_code = Language.find_by(code: lan).developers.to_a
          else
            search_dev_code = search_dev_code.intersection(Language.find_by(code: lan).developers.to_a)
          end
        else
          # no result
          @@dev = []
          redirect_to result_path and return
        end
      end

      if params[:name].length > 0
        @@dev = @@dev.intersection(search_dev_code) 
      else
        @@dev = search_dev_code
      end
    end
    redirect_to result_path
  end

  def displayresult
      @dev = @@dev
  end

  private

  def interview_params
    params.require(:interview).permit(:score)
  end
    
end