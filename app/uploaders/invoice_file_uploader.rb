# frozen_string_literal: true

class InvoiceFileUploader < CarrierWave::Uploader::Base
  # storage :file

  def store_dir
    "#{env_path}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w[pdf]
  end

  def size_range
    1..10.megabytes
  end

  private

  def env_path
    env = Rails.env.test? ? '/spec' : ''
    "uploads#{env}"
  end
end
