class ServicesController < ApplicationController
	def new
		@service = Service.new
    end

    def index
			@services = Service.order(id: :DESC).all
	end

    def create 
    	@service = Service.new(service_params)

				if @service.save
					flash['success'] = 'New Service has been successfully created'
					redirect_to action: "index"
				else 
					render 'new'
				end
    end

    def update
  			@service = Service.find(params[:id])
 
  				if @service.update(service_params)
   					flash['success'] = 'Service has been successfully updated'
					redirect_to action: "index"
  				else
    				render 'edit'
  				end
	end

	def destroy
			@service = Service.find(params[:id])
			@service.destroy
			flash['success'] = 'Service has been successfully deleted.'
			redirect_to services_path
		end

    def show
			@service = Service.find(params[:id])
	end

	def edit
 			 @service = Service.find(params[:id])
	end

    private
			def service_params
			params.require(:service).permit(:title, :text, :fa_icon, :published, :weight)
		end
end
