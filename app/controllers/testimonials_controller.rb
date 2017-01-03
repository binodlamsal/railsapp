class TestimonialsController < ApplicationController

	def new
		@service = Testimonial.new
	end

	def index
			@testimonials = Testimonial.order(id: :DESC).all
	end

	def create
		@testimonial = Testimonial.new(testimonial_params)

		uploaded_io = params[:testimonial][:picture]
			File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
			file.write(uploaded_io.read)
			
		end

		@testimonial.picture = uploaded_io.original_filename

				if @testimonial.save
					flash['success'] = 'New Testimonial has been successfully created'
					redirect_to action: "index"
				else 
					render 'new'
				end

	end

	def update
  			@testimonial = Testimonial.find(params[:id])

  			if(params[:testimonial][:picture].blank? == true)

  				@picture = @testimonial.picture

  			else 

				uploaded_io = params[:testimonial][:picture]
				
				File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
					file.write(uploaded_io.read)
				end

  				@picture = uploaded_io.original_filename

  			end

  			   #abort @picture.inspect
  			   @updatetesti = testimonial_params

  			   @updatetesti[:picture] = @picture

  			   @updatetesti[:picture].inspect;
 
  				if @testimonial.update(@updatetesti)
   					flash['success'] = 'Testimonial has been successfully updated'
					redirect_to action: "index"
  				else
    				render 'edit'
  				end
	end

	def destroy
			@testimonial = Testimonial.find(params[:id])
			@testimonial.destroy
			flash['success'] = 'Testimonial has been successfully deleted.'
			redirect_to testimonials_path
		end

    def show
			@testimonial = Testimonial.find(params[:id])
	end

	def edit
 			 @testimonial = Testimonial.find(params[:id])
	end

	 private
			def testimonial_params
			params.require(:testimonial).permit(:title, :degination, :text, :picture, :published, :weight)
		end

end
