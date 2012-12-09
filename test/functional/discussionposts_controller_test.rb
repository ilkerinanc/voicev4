require 'test_helper'

class DiscussionpostsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Discussionpost.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Discussionpost.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Discussionpost.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to discussionpost_url(assigns(:discussionpost))
  end

  def test_edit
    get :edit, :id => Discussionpost.first
    assert_template 'edit'
  end

  def test_update_invalid
    Discussionpost.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Discussionpost.first
    assert_template 'edit'
  end

  def test_update_valid
    Discussionpost.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Discussionpost.first
    assert_redirected_to discussionpost_url(assigns(:discussionpost))
  end

  def test_destroy
    discussionpost = Discussionpost.first
    delete :destroy, :id => discussionpost
    assert_redirected_to discussionposts_url
    assert !Discussionpost.exists?(discussionpost.id)
  end
end
