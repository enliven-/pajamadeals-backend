require_relative '../test_helper'

class ImageTest < MiniTest::Test

  def test_image_attributes
    image = Image.new

    assert image.respond_to?(:name)
    assert image.respond_to?(:book)
  end
end
