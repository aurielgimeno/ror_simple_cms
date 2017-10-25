class SubjectsController < ApplicationController
  
  layout 'admin'
  before_action :confirm_logged_in
  before_action :subject_count, :only => [:new, :create, :edit, :update]
  
  def index
    logger.debug("**** Testing Logger. ****")
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    # instantiate a new object
    @subject = Subject.new(subject_params)
    # save
    if @subject.save
      flash[:notice] = "Subject created successfuly."
      redirect_to(subjects_path)
    else
      # if save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    # instantiate a new object
    @subject = Subject.find(params[:id])
    # updae
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfuly."
      redirect_to(subject_path(@subject))
    else
      # if save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject destroyed '#{@subject.name}' successfuly."
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end

  def subject_count
    @subject_count = Subject.count
    actions = ['new', 'create']
    @subject_count += 1 if actions.include?(params[:action])
  end


end
