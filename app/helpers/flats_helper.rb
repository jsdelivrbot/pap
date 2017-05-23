module FlatsHelper
  def photo_path_for(flat)
    if flat.photo?
      cl_image_path flat.photo.path, width: 400, height: 300, crop: :fill
    else
      cl_image_path "hsrta9zuz8sff8u3jbfv", width: 400, height: 300, crop: :fill
    end
  end
end
