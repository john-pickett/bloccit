class User < ActiveRecord::Base

  before_save { self.email = email.downcase if email.present? }
  before_save :cap_name

  validates :name, length: { minimum: 1, maximim: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  has_secure_password

  def cap_name
    if name
      capped = []
      name.split.each do |word|
        capped << word.capitalize
      end
      self.name = capped.join(" ")
    end
  end
end
