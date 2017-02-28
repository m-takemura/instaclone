class Photo < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user

  # ------------------------------------------------------------------
  # Validations
  # ------------------------------------------------------------------
  validate def check_image_exists
    # Rails.logger.info "Image upload dimensions: #{geometry[:width]}x#{geometry[:height]}"
    # if geometry[:width] < 400 || geometry[:height] < 400
    #   errors.add :image, '400x400ピクセル以上のサイズの画像をアップロードしてください'
    # end
      if not(picture.file and File.exists?(picture.file.file))
        errors.add :picture, ' 画像をアップロードしてください'
      end
  end

  # # ------------------------------------------------------------------
  # # Public Instance Methods
  # # ------------------------------------------------------------------
  # def geometry
  #   @geometry ||= _geometry
  # end
  #
  # private
  # # ------------------------------------------------------------------
  # # Private Instance Methods
  # # ------------------------------------------------------------------
  # def _geometry
  #   if picture.file and File.exists?(picture.file.file)
  #     img = ::Magick::Image::read(picture.file.file).first
  #     { width: img.columns, height: img.rows }
  #   end
  # end
end
