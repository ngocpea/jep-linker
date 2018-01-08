class CreateLink
  def create_new_link(long_url)
    link = Link.new(long_url: long_url)
    link.valid?
    return "please enter your link" if link.errors[:long_url].any?
    link.create_short_url until link.save
    "Your link has been shortened. Your short link is #{link.short_url}"
  end
end
