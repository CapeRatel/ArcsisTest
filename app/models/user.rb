class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable

  validates :first_name, :last_name, :phone, presence: true
  validates :phone, format: /\A[+]?[0-9]+\z/, length: { minimum: 11 }

  default_scope -> { order(created_at: :desc) }
end
