require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_template 'new'
  end

  test "should get create" do
		#Event.any_instance.stubs(:valid?).returns(false)
    post :create
		assert_redirected_to events_url
  end

  test "should get show" do
		@controller.stubs(:current_user).returns(User.first)
		Event.any_instance.stubs(:valid?).returns(true)
    get :show, :id => "ignored"
    assert_response :success
  end

  test "should get destroy" do
		#@controller.stubs(:current_user).returns(User.first)
		#Event.any_instance.stubs(:valid?).returns(true)
    get :destroy, :id => "ignored"
    assert_response :success
  end

  test "should get edit" do
		#@controller.stubs(:current_user).returns(User.first)
    get :edit, :id => "ignored"
    assert_template 'edit'
  end

#  test "should create event" do
#  	assert_difference('Event.count') do
#  	  post :create, :post => { :title => 'EventTest', :description => 'This is test event.'}
#  	end
#  	assert_redirected_to events_url
#		assert_response :success
#	end

end
