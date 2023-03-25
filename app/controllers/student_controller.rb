class StudentsController < ApplicationController
    before_action :set_instructor, only: [:index, :create]
    before_action :set_student, only: [:show, :update, :destroy]
  
    def index
      students = @instructor.students
      render json: students
    end
  
    def show
      render json: @student
    end
  
    def create
      student = @instructor.students.new(student_params)
      if student.save
        render json: student, status: :created
      else
        render json: { error: student.errors }, status: :unprocessable_entity
      end
    end
  
    def update
      if @student.update(student_params)
        render json: @student
  