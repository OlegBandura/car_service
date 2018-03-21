# User mogel
class User < ApplicationRecord
  has_many :garages, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # ROLES = %i[client director]
  # def roles=(roles)
  #   roles = [*roles].map { |r| r.to_sym }
  #   self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  # end
  #
  # def roles
  #   ROLES.reject do |r|
  #     ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
  #   end
  # end
  #
  # def has_role?(roles)
  #   roles.include?(roles)
  # end

  extend Enumerize

  serialize :user_roles, Array

  enumerize :user_roles, in:
  # {client: 0, owner: 1}
    %i[client director], predicates: true

  serialize :admin_role, Array
  enumerize :admin_role, in: %i[admin]
end
