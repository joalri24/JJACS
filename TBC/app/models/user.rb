class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #---------
  belongs_to :tranvia
  belongs_to :mobibus
  has_one :vcub
  has_many :prestamos
  has_many :reservas
end
