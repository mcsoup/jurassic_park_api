require 'test_helper'

class DinosaurTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Dinosaur.new.valid?
  end
end
