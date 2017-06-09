class UserPictureUploader < UploaderBase
  # Create different versions of your uploaded files:
  sizes = { xsmall: [30, 30], small: [50, 50], medium: [100, 100], large: [200, 200] }

  sizes.each do |name, size|
    version name.to_sym do
      version :fit do
        process resize_to_fit: size
      end
      version :fill do
        process resize_to_fill: size
      end
      version :limit do
        process resize_to_limit: size
      end
    end
  end
end
