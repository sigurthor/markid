# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process :tags => ['model_images']


  version :thumbnail do
    resize_to_fit(100, 100)
  end

end
