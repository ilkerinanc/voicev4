class SurveyInterestsController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@survey_interest = @survey.survey_interests.build(:interest_id => params[:interest_id])
	  if @survey_interest.save
		  redirect_to :back, :notice => "Successfully subscribed!"
	  else
		  render :action => 'new'
    end
  end 

  def destroy
  	@survey_interest = @survey.survey_interests.find_by_interest_id(params[:interest_id])
	  @survey_interest.destroy
    redirect_to :back, :notice => "Successfully unsubscribed."
  end
end
