# == Schema Information
#
# Table name: cv_download_counts
#
#  id         :integer         not null, primary key
#  count      :integer
#  created_at :datetime
#  updated_at :datetime
#

class CvDownloadCount < ActiveRecord::Base
  CV_URL = "/cv.pdf"
  
  before_save :defaults_init

  def defaults_init
    count ||= 0
  end

  def self.get_count
    CvDownloadCount.get.count
  end

  def self.get
    CvDownloadCount.find_or_create_by_id(1)
  end

  def self.get_and_increment
    cdc = CvDownloadCount.find_or_create_by_id(1)
    cdc.increment
    cdc.save
  end

  def increment
    self.count = self.count.present? ? self.count + 1 : 1
  end
end
