# == Schema Information
#
# Table name: updates
#
#  id         :integer         not null, primary key
#  body       :text
#  date       :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Update < ActiveRecord::Base
  attr_accessible :body, :date

  def pretty_date
    self.date.strftime("%m/%-d/%y")
  end
end
