module ApplicationHelper
  
  def class_name(object)
    object.class.to_s.downcase
  end

  def edit_item_url(item)
    send("edit_#{class_name(item)}_url", item)
  end

  def delete_item_url(item)
    send("#{class_name(item)}_url", item)
  end

end
