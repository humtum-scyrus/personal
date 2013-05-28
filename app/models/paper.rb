class Paper < ActiveRecord::Base
  has_attached_file :pdf
  has_and_belongs_to_many :collaborators

  validates_attachment_content_type :pdf, :content_type => ['application/pdf', 'application/msword', 'text/plain']
  attr_reader :tokenCollabList

  def tokenCollabList=(list)
    self.collaborator_ids = list.split(",")
  end
end
# == Schema Information
#
# Table name: papers
#
#  id                :integer         not null, primary key
#  citation          :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  pdf_file_name     :string(255)
#  pdf_content_type  :string(255)
#  pdf_file_size     :integer
#  pdf_updated_at    :datetime
#  year              :integer
#  venue             :string(255)
#  accept_rate       :float
#  title             :string(255)
#  self_author_order :integer
#  volume            :integer
#  issue             :integer
#  page_nums         :string(255)
#  papertype         :string(255)
#

