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
    params['results'].each do |key, value|
      a = Answer.find(key.to_i)
      a.count ||= 0
      a.count += 1
      a.save
    end
    s = SurveyUser.new
    s.userId = current_user.id
    s.surveyId = params['survey_id']

    if s.save   
      redirect_to surveys_path, :notice  => "Successfully submitted Your Survey Answers."
    else
      redirect_to surveys_path :notice => "kaydolmadik!!!!!!!!!"
    end
  end
end
