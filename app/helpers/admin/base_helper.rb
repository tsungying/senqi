module Admin::BaseHelper

  def nav_link(link_text, link_path)
    class_name = request.original_url.include?(link_path) ? 'active' : nil
    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  def translate_language_name(language)
    language == 'en' ? "英文" : "中文"
  end

  def set_title(instance_var)
    instance_var.new_record? ? "新增" : "編輯"
  end

  def set_button_name(instance_var)
    instance_var.new_record? ? "新建公司簡介" : "更新公司簡介"
  end

end
