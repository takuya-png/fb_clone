require 'test_helper'

class PictureBlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @picture_blog = picture_blogs(:one)
  end

  test "should get index" do
    get picture_blogs_url
    assert_response :success
  end

  test "should get new" do
    get new_picture_blog_url
    assert_response :success
  end

  test "should create picture_blog" do
    assert_difference('PictureBlog.count') do
      post picture_blogs_url, params: { picture_blog: { content: @picture_blog.content, image: @picture_blog.image, title: @picture_blog.title } }
    end

    assert_redirected_to picture_blog_url(PictureBlog.last)
  end

  test "should show picture_blog" do
    get picture_blog_url(@picture_blog)
    assert_response :success
  end

  test "should get edit" do
    get edit_picture_blog_url(@picture_blog)
    assert_response :success
  end

  test "should update picture_blog" do
    patch picture_blog_url(@picture_blog), params: { picture_blog: { content: @picture_blog.content, image: @picture_blog.image, title: @picture_blog.title } }
    assert_redirected_to picture_blog_url(@picture_blog)
  end

  test "should destroy picture_blog" do
    assert_difference('PictureBlog.count', -1) do
      delete picture_blog_url(@picture_blog)
    end

    assert_redirected_to picture_blogs_url
  end
end
