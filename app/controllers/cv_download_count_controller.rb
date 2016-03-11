class CvDownloadCountController < ApplicationController
  def increment
    CvDownloadCount.get_and_increment

    redirect_to CvDownloadCount::CV_URL
  end
end
