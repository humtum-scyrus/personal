class Project < ActiveRecord::Base
  has_attached_file :featured,
    :styles => {
      :full => "940x300#"
    }

  has_attached_file :preview,
    :styles => {
      :mglarge => "320x240#",
      :projthumb => "180x180#",
      :mgsmall => "260x180#" }
    #:storage => :s3,
    #:bucket => 'tw_bucket',
    #:s3_credentials => {
    #  :access_key_id => ENV['S3_KEY'],
    #  :secret_access_key => ENV['S3_SECRET']
    #}

  validates_attachment_content_type :featured, :content_type => ['image/jpeg', 'image/png', 'image/bmp', 'image/gif']
  validates_attachment_content_type :preview, :content_type => ['image/jpeg', 'image/png', 'image/bmp', 'image/gif']
  has_and_belongs_to_many :collaborators
  serialize :tags,Array 
  attr_reader :tokenCollabList
  #attr_accessible :tokenCollabList


  def has_tag?(tag)
    self.tags.include?(tag)
  end

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
# Table name: projects
#
#  id                    :integer         not null, primary key
#  tags                  :text
#  markup                :text
#  description           :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  featured_file_name    :string(255)
#  featured_content_type :string(255)
#  featured_file_size    :integer
#  featured_updated_at   :datetime
#  preview_file_name     :string(255)
#  preview_content_type  :string(255)
#  preview_file_size     :integer
#  preview_updated_at    :datetime
#  title                 :string(255)
#  is_featured           :boolean
#

