class User < ActiveRecord::Base
  before_validation :populate_slug

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :session_authenticatable, :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :admin
  # attr_accessible :title, :body

  def pg_user
    @PgUser ||= PgUser.find(1, params: { slug: self.slug })
  rescue
    nil
  end

  def has_permission?(permission_name)
    pg_user && pg_user.group && pg_user.group.permissions.include?(permission_name)
  end

  def store_admin?
    has_permission?('store_admin')
  end

  def populate_slug
    self.slug = self.username.downcase.gsub(/\s/, "_") if self.username.present?
    true
  end
end
