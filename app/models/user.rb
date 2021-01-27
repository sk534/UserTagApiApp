class User < ApplicationRecord
  scope :active,->{where(is_active: true)}
  has_many :tags, dependent: :destroy
  validates_uniqueness_of :username
  #acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
