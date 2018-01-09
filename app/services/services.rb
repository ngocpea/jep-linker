module Services
  class Url
    def self.find_or_create(long_url:)
      url_string = build_url_string(set_url(url: long_url))
      link = Link.find_by(:long_url => url_string)
      return link if link.present?
      unique_id = Link.all.count + 1
      short_link = unique_id.to_s + SecureRandom.base64(6) 
      valid_url = set_url(url: long_url)
      Link.create(long_url: valid_url, short_url: short_link)
    end

    def self.set_url(url:)
      Addressable::URI.heuristic_parse(url)
    end

    def self.build_url_string(url_object)
      "#{url_object.scheme}://#{url_object.host}" 
    end

  end
end





