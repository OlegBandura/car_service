# garage comment model
class GarageComment < ApplicationRecord
  belongs_to :garage
  belongs_to :user

  # delegate :name, to: :user, prefix: true

  scope :comment, ->(id) { joins(:garage, :user).select(
    'users.name, users.surname, garage_comments.comment,
    garage_comments.created_at').where(
    'users.id = garage_comments.user_id and garage_id = ?', id
    ) }

end
