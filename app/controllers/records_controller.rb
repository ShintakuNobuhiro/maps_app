class RecordsController < ApplicationController
before_action :signed_in_user, only: [:create, :destroy]

    def index
        @records = Record.all
        respond_to do |format|
          format.json # app/views/records/index.json.jbuilder
        end
    end

    def create
        @record = current_user.records.build(records_params)
        if @record.save
            flash[:success] = "作成されました！"
            redirect_to root_url
        else
            render 'static_pages/home'
        end
    end

    def destroy
    end
    
    def records_params
        params.require(:record).permit(:content,:lat, :lng, :weather, :date)
    end
end