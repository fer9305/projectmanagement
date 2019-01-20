class Task < ApplicationRecord
  has_many :user_tasks
  has_many :users, through: :user_tasks
  accepts_nested_attributes_for :user_tasks, reject_if: :all_blank, allow_destroy: true
  has_many :attachments
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true
  belongs_to :project

  validates_presence_of :name, :deadline
end
