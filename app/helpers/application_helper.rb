module ApplicationHelper
  def field_error_message(object, field)
    return unless defined?(@form_submitted) && @form_submitted
    return unless object.errors[field].any?

    content_tag(:p, object.errors[field].first, class: "text-red-500 text-sm mt-1")
  end
end
