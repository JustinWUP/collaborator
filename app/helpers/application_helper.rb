module ApplicationHelper
	def page_title
		content_for?(:page_title) ? content_for(:page_title) : "Collaborator"
	end

	def icon(name, size=1)
	    #icon("camera-retro")
	    #<i class="icon-camera-retro"></i> 
	    
	    html = "<i class='icon-#{name}' "
	    html += "style='font-size:#{size}em' "
	    html += "></i><br>"
	    html.html_safe
  	end


	def nav_links_menu
		links = content_for :nav_links
		reverse = links.split('split').reverse.join
		menu = <<NAVMENU
<ul class="nav-ul">

#{reverse}
<ul>		
NAVMENU
		return menu.html_safe
	end


	def add_nav_link(link)
		content_for :nav_links do 
		" <li>#{link}</li> <i class='icon-caret-left' style='color:#7B7B7B;'></i>split".html_safe 
		end
	end

	def github_render_text(text)
		auto_link(BlueCloth.new(text).to_html.html_safe)
	end

	def cp(path)
		if params[:controller] == "topics"
			@hey = "projects"
		elsif %w[registrations settings organizations subscriptions].include? params[:controller] 
			@hey = "user"
		else
			@hey = params[:controller]
		end
		"current" if @hey.include? path.gsub("/",'')
	end

  def subscription_link(subscription, object)
    type = object.class.to_s
    if subscription.subscribed?
       return link_to icon('envelope', 2) +'Stop Watching ' + type.humanize, toggle_subscription_path(subscription.id), :class => "subscribe useractions"
    else
       return link_to icon('envelope-alt', 2) +'Watch This ' + type.humanize, toggle_subscription_path(subscription.id),  :class => "subscribe useractions"
    end
  end
end
