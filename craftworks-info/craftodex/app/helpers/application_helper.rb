module ApplicationHelper
	def avatar_url(person)
     gravatar_id = Digest::MD5.hexdigest(person.email.downcase)
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=150&d=mm"
  end
end
