class Link < ApplicationRecord
  belongs_to :user, optional: true

  validates :long_url, presence: true

  before_save :ensure_custom_url_has_a_value

  private

  def ensure_custom_url_has_a_value
    if custom_url.nil?
      domain = ENV.fetch('DOMAIN', 'http://localhost:3000/')
      rnd = SecureRandom.alphanumeric(ENV.fetch('RAND_SIZE', 5)).upcase
      while Link.exists?(custom_url: "#{domain}#{rnd}")
        rnd = SecureRandom.alphanumeric(ENV.fetch('RAND_SIZE', 5)).upcase
      end
      self.custom_url = "#{domain}#{rnd}"
    end
  end
end
