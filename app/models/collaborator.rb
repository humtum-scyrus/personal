class Collaborator < ActiveRecord::Base
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :essays
  has_and_belongs_to_many :papers

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name=(name)
    first_name,last_name = name.split(' ')
  end

  def name_auth
    "#{last_name}, #{first_name[0]}."
  end

  def as_json(options={})
    {
      id: self.id,
      name: self.full_name
    }
  end
end
# == Schema Information
#
# Table name: collaborators
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  website    :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

