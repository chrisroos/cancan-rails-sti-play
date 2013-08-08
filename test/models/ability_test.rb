require 'test_helper'

class AbilityTest < ActiveSupport::TestCase
  setup do
    @user = User.create!
    @ability = Ability.new(@user)
  end

  test 'allows user to read pages that they authored' do
    page = Page.create!(user: @user)

    assert @ability.can?(:read, page)
  end

  test 'allows user to read blog posts that they authored' do
    blog_post = BlogPost.create!(user: @user)

    assert @ability.can?(:read, blog_post)
  end

  test 'does not allow user to read pages authored by someone else' do
    another_user = User.create!
    page = Page.create!(user: another_user)

    assert @ability.cannot?(:read, page)
  end

  test 'does not allow user to read blog posts authored by someone else' do
    another_user = User.create!
    blog_post = BlogPost.create!(user: another_user)

    assert @ability.cannot?(:read, blog_post)
  end

  test 'allows user to read comments on pages that they authored' do
    page = Page.create!(user: @user)
    comment = Comment.create!(page: page)

    assert @ability.can?(:read, comment)
    assert @ability.can?(:read, page => Comment)
  end

  test 'does not allow user to read comments on pages that someone else authored' do
    another_user = User.create!
    page = Page.create!(user: another_user)
    comment = Comment.create!(page: page)

    assert @ability.cannot?(:read, comment)
    assert @ability.cannot?(:read, page => Comment)
  end

  test 'allows user to read comments on blog posts that they authored' do
    blog_post = BlogPost.create!(user: @user)
    comment = Comment.create!(page: blog_post)

    assert @ability.can?(:read, comment)
    assert @ability.can?(:read, blog_post => Comment)
  end

  test 'does not allow user to read comments on blog posts that someone else authored' do
    another_user = User.create!
    blog_post = BlogPost.create!(user: another_user)
    comment = Comment.create!(page: blog_post)

    assert @ability.cannot?(:read, comment)
    assert @ability.cannot?(:read, blog_post => Comment) # This assertion fails and I'm not sure it should
  end
end
