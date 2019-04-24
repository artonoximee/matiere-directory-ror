class Admin::ReferenceClassesController < ApplicationController
	before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]

	def new
		@reference_classes = ReferenceClass.all
	end

	def create
		ReferenceClass.create(name: params[:name])
    	redirect_to new_admin_reference_class_path
	end

	def edit
		@reference_class = ReferenceClass.find(params[:id])
	end

	def update
		reference_class = ReferenceClass.find(params[:id])
    reference_class.update(name: params[:name])
    redirect_to new_admin_reference_class_path
	end

	def destroy
		reference_class = ReferenceClass.find(params[:id])
    reference_class.destroy
    redirect_to new_admin_reference_class_path
	end
end
