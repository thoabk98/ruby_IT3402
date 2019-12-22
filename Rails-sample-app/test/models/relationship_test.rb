# frozen_string_literal: true

require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @relationship = Relationship.new(follower_id: users(:one).id,
                                     followed_id: users(:archer).id)
  end

  test 'should be valid' do
    assert @relationship.valid?
  end

  test 'should require a follower_id' do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test 'should require a followed_id' do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end

  test 'should follow and unfollow a user' do
    one =  users(:one)
    archer = users(:archer)
    assert_not one.following?(archer)
    one.follow(archer)
    assert one.following?(archer)
    assert archer.followers.include?(one)
    one.unfollow(archer)
    assert_not one.following?(archer)
  end
end
