class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # 

  validates :first_name, :last_name, :address_line1, :country, :state, :city, :phone, presence: true

  has_many :watchlists
  has_many :bids
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



end
