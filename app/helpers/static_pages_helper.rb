module StaticPagesHelper

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
