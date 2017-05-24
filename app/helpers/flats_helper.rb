module FlatsHelper
  def photo_path_for(flat)
    if flat.photos?
      cl_image_path flat.photos.first.path
    end
  end
end

