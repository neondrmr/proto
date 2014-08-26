# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  url        :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
  require 'uri'
  belongs_to :user
  has_many :comments
  before_save :validate_protocol  


  private
  
  def validate_protocol
    surl0 = self.url
    surl1 = URI.parse(surl0)
    self.url = "http://#{surl0}" if surl1.scheme.blank?
  end
end
