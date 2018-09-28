module ApplicationHelper
  def flash_class(level)
    case level
      when "notice" then "alert-info"
      when "success" then "alert-success"
      when "error" then "alert-error"
      when "alert" then "alert-error"
    end
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer)

    markdown.render(text).html_safe
  end
end
