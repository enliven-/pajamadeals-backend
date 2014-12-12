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

  def test_image_uploads
    image = create :image, file: File.open(File.join(App.root, 'test',
                                                 'fixtures', 'test_image1.jpg'))

    assert image.file.present?
    assert_equal "/uploads/image/file/#{image.id}/test_image1.jpg",
                                                                  image.file.url
    assert image.file.thumb.present?
  end
end
