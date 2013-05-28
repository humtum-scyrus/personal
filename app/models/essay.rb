class Essay < ActiveRecord::Base
  has_and_belongs_to_many :collaborators
  serialize :tags, Array
  attr_reader :tokenCollabList

  def tokenCollabList=(list)
    self.collaborator_ids = list.split(",")
  end

  def taglist
    self.tags.join(',')
  end

  def taglist=(list)
    self.tags = list.split(',').map { |t| t.strip }
    self.save
  end
end
# == Schema Information
#
# Table name: essays
#
#  id          :integer         not null, primary key
#  description :string(255)
#  tags        :text
#  markup      :text
#  created_at  :datetime
#  updated_at  :datetime
#  title       :string(255)
#

