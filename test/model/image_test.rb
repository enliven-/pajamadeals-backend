require_relative '../test_helper'

class ImageTest < MiniTest::Test

  def test_image_attributes
    image = Image.new

    assert image.respond_to?(:file)
  end

  def test_image_relations
    image = Image.new

    assert image.respond_to?(:book)
  end
end
