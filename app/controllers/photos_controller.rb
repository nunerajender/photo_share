class PhotosController < ApplicationController
before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


	def new
		@photo = current_user.photos.build
	end	
	
	def index
		@photos =  Photo.all.order("created_at DESC").paginate(:page => params[:page])
		
	end

	def show
		@photo = Photo.find(params[:id])
	end
	
	def edit
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])

		if @photo.update(photo_params)
			redirect_to @photo, notice: 'Photo was successfully updated.'
		else
			render action: 'edit'
		end
	end

	def create
		@photo = current_user.photos.build(photo_params)

		if @photo.save
			redirect_to @photo, notice: 'Photo was successfully created'
		else
			render action: 'new'
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@photo.destroy

		redirect_to photos_path
	end
	
	private
		def set_photo
			@photo = Photo.find(params[:id])
		end
		def correct_user
      	@photo = current_user.photos.find_by(id: params[:id])
      redirect_to photos_path, notice: "Not authorized to edit this Photo" if @photo.nil?
   		 end
		def photo_params
				params.require(:photo).permit(:user_id, :title, :text, :image)
		end		
end

