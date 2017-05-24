module FlatsHelper
  def photo_path_for(flat)
    if flat.photo?
      cl_image_path flat.photo.path
    elsif cl_image_path "hsrta9zuz8sff8u3jbfv".present?
      cl_image_path "hsrta9zuz8sff8u3jbfv"
    else
      ''
    end
  end
end


