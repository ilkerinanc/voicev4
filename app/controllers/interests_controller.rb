class InterestsController < ApplicationController
  def index
  	@interests = Interest.where("name like ?", "%#{params[:q]}%")
  	respond_to do |format|
  		format.html
  		format.json {render :json => @interests.map(&:attributes)}
  	end 
  end

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(params[:interest])
    @interest.in_trash = false
    @interest.creator_id = current_user.id
    if @interest.save
      UserActivity.create(
          :user_id => current_user.id,
          :klass => "Interest",
          :klass_id => @interest.id,
          :action => "created interest"
          )
      redirect_to interest_path(@interest.id), :notice => "Successfully created interest."
    else
      render :action => 'new'
    end
  end

  def update
    @interest = Interest.find(params[:id])
    if @interest.update_attributes(params[:interest])
      redirect_to interest_path(:interest => @interest.id), :notice => "Interest has been updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @interest = Interest.find(params[:interest_id])
    @interest.destroy
    redirect_to interests_url, :notice => "Successfully destroyed interest."
  end

  def show
    @interest = Interest.find(params[:id])
    @events = EventInterest.where(interest_id = 2).collect {|ei| ei.event}
    # @events = EventInterest.where(interest_id: params[:id])
  end

  def edit
    @interest = Interest.find(params[:id])
  end
end
