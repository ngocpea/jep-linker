class LinkOriginValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value

    if value.include?("bit.ly") || value.include?("goo.gl")
      record.errors[attribute] << (options[:message] || "is already a shortened URL")
    end
  end
end
