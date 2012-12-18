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
			
			#####SEMİH#########
      #@survey = Survey.find_by_id(params[:id])
      #@survey = Survey.new
      #@surveyUser = SurveyUser.new
      #@surveyUser.answerId = Survey.find_by_id(params[:id])
      #@surveyUser.questionId = Survey.find_by_id(params[:id])
      #@surveyUser.surveyId = params[:surveyId]
      #@surveyUser.userId = current_user.id
			
      #if @surveyUser.save
      #    redirect_to @survey, :notice  => "Successfully submitted Your Survey Answers."
      #else
      #   redirect_to @survey, :notice  => "Error happens when you submit your Survey Answer"
      #end
			##################
			@survey = Survey.find_by_id(params["surveyId"])	
			#@questions = @survey.questions
		
			unless params[:question][:answers].nil?
				puts "questiona girdi"	
     		params[:question][:answers].each do |a|
 #    			@surveyUser = SurveyUser.create(:answer_id => a, :question_id => q, :survey_id => params["surveyId"], :user_id => current_user.id)	
	#				if @surveyUser.save
		#			end
				end
    	end			

#			@questions.each do |q|
#				@answers = q.answers
#				@answers.each do |a|
#					puts params["#{q.id}.#{a.id}"]
	#				if params["#{q.id}.#{a.id}"] == 1
	#					@surveyUser = SurveyUser.new	
	#					@surveyUser.answerId = params["#{a.id}"]
 #     			@surveyUser.questionId = params["#{q.id}"]
 #     			@surveyUser.surveyId = params["surveyId"]
 #     			@surveyUser.userId = current_user.id
	#					if @surveyUser.save
	#						#redirect_to @survey, :notice  => "#{a.id}.#{q.id}.#{surveyId}"
	#					else
	#						#redirect_to @survey, :notice  => "Error happens when you submit your Survey Answer"
	#					end
	#				end				
	#			end
	#		end 
			redirect_to @survey, :notice  => "Successfully submitted Your Survey Answers."

  end
end
