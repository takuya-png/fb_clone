require "application_system_test_case"

class PictureBlogsTest < ApplicationSystemTestCase
  setup do
    @picture_blog = picture_blogs(:one)
  end

  test "visiting the index" do
    visit picture_blogs_url
    assert_selector "h1", text: "Picture Blogs"
  end

  test "creating a Picture blog" do
    visit picture_blogs_url
    click_on "New Picture Blog"

    fill_in "Content", with: @picture_blog.content
    fill_in "Image", with: @picture_blog.image
    fill_in "Title", with: @picture_blog.title
    click_on "Create Picture blog"

    assert_text "Picture blog was successfully created"
    click_on "Back"
  end

  test "updating a Picture blog" do
    visit picture_blogs_url
    click_on "Edit", match: :first

    fill_in "Content", with: @picture_blog.content
    fill_in "Image", with: @picture_blog.image
    fill_in "Title", with: @picture_blog.title
    click_on "Update Picture blog"

    assert_text "Picture blog was successfully updated"
    click_on "Back"
  end

  test "destroying a Picture blog" do
    visit picture_blogs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Picture blog was successfully destroyed"
  end
end
