class Task < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true

  scope :completed, -> { where(completed: true) }

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def mark_complete!
    self.update_attribute(:completed, true)
  end
end
