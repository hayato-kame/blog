module ApplicationHelper
  
  def page_title
    title = "Blog"
    title = @page_title + " - " + title if @page_title
  end
end
