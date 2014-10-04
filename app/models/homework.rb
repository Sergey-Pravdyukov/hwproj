class Homework < ActiveRecord::Base
  belongs_to :group
  has_many :problems, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :tasks
  has_many :links, as: :parent, dependent: :destroy
  has_many :awards, through: :job
  validates_associated :problems
  validates :group_id, presence: true
  accepts_nested_attributes_for :problems, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true
end
