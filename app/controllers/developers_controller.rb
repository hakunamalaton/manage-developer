class DevelopersController < ApplicationController
    
    def index
        @developers = Developer.all
    end

    def new
        
    end

    def get
        search_dev_name = nil
        @@dev = []
        if params[:name].length > 0
          search_dev_name = ProgrammingLanguage.find_by(name: params[:name]) 
          if search_dev_name == nil
            redirect_to "/result" and return
          end
          search_dev_name = search_dev_name.developers.to_a
        end

        search_dev_code = nil
        if params[:code].length > 0
          search_dev_code = Language.find_by(code: params[:code]) 
          if search_dev_code == nil
            redirect_to "/result" and return
          end
          search_dev_code = search_dev_code.developers.to_a
        end


        if search_dev_name && search_dev_code
            arr = search_dev_name.intersection(search_dev_code)
            @@dev = arr
           
        elsif search_dev_name
            arr = search_dev_name
            @@dev = arr
            
        elsif search_dev_code
            arr = search_dev_code
            @@dev = arr
        end
        redirect_to "/result"
        # rescue StandardError => e
        #     respond_with_error(e)
    end

    def displayresult
        @dev = @@dev
    end
    
end