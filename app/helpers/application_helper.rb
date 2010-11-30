module ApplicationHelper
  def section_link(name,options)
      if options[:action] == params[:action] and options[:controller] == params[:controller]
        link_to "<div class='tab selected'>#{name}</div>".html_safe, options
      else
        puts options
        link_to "<div class='tab'>#{name}</div>".html_safe, options
      end
  end
end
