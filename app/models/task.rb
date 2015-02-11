class Task < ActiveRecord::Base
  belongs_to :user

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def mark_complete!
    self.update_attribute(:completed, true)
  end
end