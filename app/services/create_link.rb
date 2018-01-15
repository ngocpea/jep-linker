class CreateLink
  def create_new_link(long_url, short_url)
    link = Link.new(long_url: long_url)
    link.valid?
    return "please enter your link" if link.errors[:long_url].any?
    if short_url.empty?
      link.create_uniq_short_url
    else
      link.user_create_uniq_short_url(short_url)
    end
    link.save
    "Your link has been shortened. Your short link is #{link.short_url}"
  end

  def self.short_link_from_existing_link(long_url, user_chosen_short_url)
    existing_link = Link.where(long_url: long_url).first
    if existing_link
      "Your short link is #{existing_link.short_url}"
    else
      CreateLink.new.create_new_link(long_url, user_chosen_short_url)
    end
  end
end
