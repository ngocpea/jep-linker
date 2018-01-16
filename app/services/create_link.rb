class CreateLink
  def create_new_link(long_url, short_url)
    # binding.pry
    link = Link.new(long_url: long_url)
    return link if !link.valid?

    if short_url.empty?
      link.create_uniq_short_url
    else
      link.user_create_uniq_short_url(short_url)
    end
    link
  end

  def self.short_link_from_existing_link(long_url, user_chosen_short_url)
    # binding.pry
    existing_link = Link.where(long_url: long_url).first
    return existing_link if existing_link
    CreateLink.new.create_new_link(long_url, user_chosen_short_url)
  end
end
