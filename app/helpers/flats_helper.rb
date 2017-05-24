module FlatsHelper
  def photo_path_for(flat)
    if flat.photos?
      cl_image_path flat.photos[0].path
    elsif cl_image_path "hsrta9zuz8sff8u3jbfv".present?
      cl_image_path "hsrta9zuz8sff8u3jbfv"
    else
      ''
    end
  end
end

