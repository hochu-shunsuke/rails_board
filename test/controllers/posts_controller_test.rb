require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get show" do
    get post_url(@post)
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user)
    get new_post_url
    assert_response :success
  end

  test "should redirect new when not logged in" do
    get new_post_url
    assert_redirected_to new_session_url
  end

  test "should create post" do
    sign_in_as(@user)
    assert_difference("Post.count") do
      post posts_url, params: { post: { content: @post.content, title: @post.title } }
    end

    assert_redirected_to posts_url
  end

  test "should get edit" do
    sign_in_as(@user)
    get edit_post_url(@post)
    assert_response :success
  end

  test "should redirect edit when not owner" do
    other_user = users(:two)
    sign_in_as(other_user)
    get edit_post_url(@post)
    assert_redirected_to posts_url
  end

  test "should update post" do
    sign_in_as(@user)
    patch post_url(@post), params: { post: { content: @post.content, title: @post.title } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    sign_in_as(@user)
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
