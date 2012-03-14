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
end
