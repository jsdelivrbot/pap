module FlatsHelper
  def photo_path_for(flat)
    if flat.photo?
      cl_image_path flat.photo.path
    end
  end
end
