class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
     @survey = Survey.new
      1.times do
        question = @survey.questions.build
        1.times { question.answers.build }
    end
  end

  def create
    @survey = Survey.new(params[:survey])
    if @survey.save
      redirect_to @survey, :notice => "Successfully created survey."
    else
      render :action => 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      redirect_to @survey, :notice  => "Successfully updated survey."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_url, :notice => "Successfully destroyed survey."
  end

  def commit

      #@survey = Survey.find_by_id(params[:id])
      raise
  
      @survey = Survey.new
      @surveyUser = SurveyUser.new
      #@temp = params[:question][:a_id]
      #params[:question][:a_id].each do |key,value|
      #  @surveyUser.answerId = key
      #end
      
      @surveyUser.questionId = nil
      @surveyUser.surveyId = Survey.find_by_id(params[:id])
      @surveyUser.userId = current_user.id

      if @surveyUser.save
          redirect_to @survey, :notice  => "Successfully submitted Your Survey Answers."
      else
         redirect_to @survey, :notice  => "Error happens when you submit your Survey Answer"
      end


  end
end