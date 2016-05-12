module ApplicationHelper

 def full_title(page_title)
  base_title = "Authentic Wine"
  page_title.empty? ?  base_title : "#{base_title} | #{page_title}"
 end

  def markdown(text)
  if text.blank?
    nil
  else
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true, filter_html:     true, hard_wrap: true, link_attributes: { rel: 'nofollow', target: "_blank" }, space_after_headers: true, fenced_code_blocks: true, superscript: true, disable_indented_code_blocks: true)
    markdown.render(text).html_safe
    end   
  end
end
