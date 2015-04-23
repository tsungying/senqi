module DeviseHelper
 def devise_error_messages!
  return '' if resource.errors.empty?

   messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
   sentence = I18n.t('errors.messages.not_saved',
   count: resource.errors.count,
   resource: resource.class.model_name.human.downcase)

   html = <<-HTML
    <div class="alert alert-warning fade in red-alert" role="alert">
      <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
      #{messages}
    </div>   
   HTML

   html.html_safe
 end
end
#<h4>#{sentence}</h4>
