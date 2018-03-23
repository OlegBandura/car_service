# User mogel
class User < ApplicationRecord
  has_many :garages, dependent: :destroy
  has_many :garage_comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  extend Enumerize

  serialize :user_roles, Array

  enumerize :user_roles, in:
  # {client: 0, owner: 1}
    %i[client owner], predicates: true

  serialize :admin_role, Array
  enumerize :admin_role, in: %i[admin], predicates: true
end
