class Link < ApplicationRecord
  validates :short_key, presence: true, uniqueness: {case_sensitive: false}

  class << self
    def create_short_link url
      loop do
        new_key = SecureRandom.alphanumeric(6)
        link = Link.new url: url, short_key: new_key
        break link if link.save
      end
    end
  end
end
