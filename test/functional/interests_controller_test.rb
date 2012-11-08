require 'test_helper'

class InterestsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Interest.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Interest.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to interests_url
  end

  def test_destroy
    interest = Interest.first
    delete :destroy, :id => interest
    assert_redirected_to interests_url
    assert !Interest.exists?(interest.id)
  end
end
