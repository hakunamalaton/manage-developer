class DevelopersController < ApplicationController
    
    def index
        @developers = Developer.all
    end

    def new
        
    end

    def get
        search_dev_name = []
        search_dev_code = []
        @@dev = []
        if params[:name].length > 0
          programming_lan = params[:name].split(",").map(&:strip).map(&:downcase).map(&:capitalize)

          programming_lan.each do |lan|
            if ProgrammingLanguage.find_by(name: lan) 
              if search_dev_name.empty?
                search_dev_name = ProgrammingLanguage.find_by(name: lan).developers.to_a
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
    
end