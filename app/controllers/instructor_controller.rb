class InstructorsController < ApplicationController
    def index
      instructors = Instructor.all
      render json: instructors
    end
  
    def show
      instructor = Instructor.find(params[:id])
      render json: instructor
    end
  
    def create
      instructor = Instructor.new(instructor_params)
      if instructor.save
        render json: instructor, status: :created
      else
        render json: { error: instructor.errors }, status: :unprocessable_entity
      end
    end
  
    def update
      instructor = Instructor.find(params[:id])
      if instructor.update(instructor_params)
        render json: instructor
      else
        render json: { error: instructor.errors }, status: :unprocessable_entity
      end
    end
  
    def destroy
      instructor = Instructor.find(params[:id])
      instructor.destroy
      head :no_content
    end
  
    private
  
    def instructor_params
      params.require(:instructor).permit(:name)
    end
  end
  
  Rails.application.routes.draw do
    resources :instructors
  end
  