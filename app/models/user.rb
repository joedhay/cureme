class User < ActiveRecord::Base
  has_one :role
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", small: "64x64>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :first_name, presence: true
  validates :phone_number, presence: true
  validates :alias, presence: true
  validates :username, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, on: :create
  validates :confirmed_password, presence: true, on: :create
  validates :email, :presence => true, :uniqueness => true
  validate  :email_regex

  def self.rehash_password pass
    if pass.present?
      if pass.length >= 8
        Digest::MD5.hexdigest(pass)
      end
    end
  end

  def self.equal_password pass,con
    if pass.present? && con.present?
      if pass == con
        true
      else
        ":Password and Confirmed Password is not equal."
      end
    end
  end



  protected

  def email_regex
    if email.present? and not email.match(/\A[^@]+@[^@]+\z/)
      self.errors.add :email, ":This is not a valid email format"
    end
  end
end
