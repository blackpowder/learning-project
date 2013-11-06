module ApplicationHelper
	def avatar_url(person)
		#default_url = "#{root_url}assets/images/guest.png"
     gravatar_id = Digest::MD5.hexdigest(person.email.downcase)
     #"http://gravatar.com/avatar/#{gravatar_id}.png?s=130&d=#{CGI.escape(default_url)}"
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=150&d=mm"
  end
end
