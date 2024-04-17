class Patient < ApplicationRecord
  belongs_to :registered_by, class_name: 'User'
  belongs_to :doctor, class_name: 'User'
  def full_name
    "#{first_name} #{last_name}"
  end
end
