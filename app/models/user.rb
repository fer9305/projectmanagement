class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :start_date

  has_many :user_tasks
  has_many :tasks, through: :user_tasks
  has_many :projects, through: :tasks
end
