module ApplicationHelper
	def page_title
		content_for?(:page_title) ? content_for(:page_title) : "Collaborator"
	end

	def nav_links_menu
		links = content_for :nav_links
		menu = <<NAVMENU
<ul class="nav-ul">
#{links}
<ul>		
NAVMENU
		return menu.html_safe
	end

	def add_nav_link(link)
		content_for :nav_links do 
			"<li>#{link}</li>".html_safe
		end
	end

	def github_render_text(text)
		auto_link(BlueCloth.new(text).to_html.html_safe)
	end

  def subscription_link(subscription, object)
    type = object.class.to_s
    if subscription.subscribed?
       return link_to "Unsubscribe to #{type.to_s.humanize}", toggle_subscription_path(subscription.id), :class => "subscribe"
    else
       return link_to "Subscribe to #{type.to_s.humanize}", toggle_subscription_path(subscription.id),  :class => "subscribe"
    end
  end
end
