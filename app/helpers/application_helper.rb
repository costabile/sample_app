module ApplicationHelper
	
	# Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "Ruby on Rails Tutorial Sample App"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	# Links the @<username> part of a reply micropost to <username>'s user page.
	def linked_reply(feed_item)
		if (feed_item.in_reply_to)
			content_split = feed_item.content.split(" ", 2)
			in_reply_to_user = User.find_by(id: feed_item.in_reply_to)
			# link_to method isn't closing the a tag for some reason.
			"#{link_to content_split[0], in_reply_to_user}</a> #{content_split[1]}"
		else
			feed_item.content
		end
	end
end
