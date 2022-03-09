class DevelopersController < ApplicationController
    
    def index
        @developers = Developer.all
    end

    def new
        
    end

    def get
        search_dev_name = ProgrammingLanguage.find_by(name: params[:name])
        search_dev_code = Language.find_by(code: params[:code])
        arr = []
        if search_dev_name && search_dev_code
            arr = search_dev_name.developers.to_a.intersection(search_dev_code.developers.to_a)
            @@dev = arr
            redirect_to "/result" 
        else
            redirect_to "/"
        end
        # rescue StandardError => e
        #     respond_with_error(e)
    end

    def displayresult
        @dev = @@dev
    end
    
end