# frozen_string_literal: true

require "cases/helper"
require "models/post"

module ActiveRecord
  class SelectTest < ActiveRecord::TestCase
    fixtures :posts

    def test_select_with_nil_argument
      expected = Post.select(:title).to_sql
      assert_equal expected, Post.select(nil).select(:title).to_sql
    end

    def test_reselect
      expected = Post.select(:title).to_sql
      assert_equal expected, Post.select(:title, :body).reselect(:title).to_sql
    end
  end
end
