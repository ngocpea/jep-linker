module Services
  class Url
    def self.find_or_create(long_url:)
      link = Link.find_by(:long_url => long_url)
      return link if link.present?
      unique_id = Link.all.count + 1
      short_link = "www.linker/#{unique_id.to_s + SecureRandom.base64(6)}" 
      Link.create(long_url: long_url, short_url: short_link)
    end

  end
end
