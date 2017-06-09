class UploaderBase < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  after :remove, :delete_empty_upstream_dirs

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def base_dir
    "uploads"
  end

  def store_dirs
    ["models", model.class.to_s.underscore, mounted_as, model.id]
  end

  def store_dir
    #"uploads/models/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    "#{base_dir}/#{store_dirs.join('/')}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  size = [1920, 1920]
  # Process files as they are uploaded:
  process resize_to_limit: size
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  version :origin do
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

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  def delete_empty_upstream_dirs
    path = ::File.expand_path(base_dir, root)
    store_dirs.each do |dir|
      path = "#{path}/#{dir}"
      Dir.delete(path) rescue true
    end
  rescue SystemCallError
    true # nothing, the dir is not empty
  end

end
