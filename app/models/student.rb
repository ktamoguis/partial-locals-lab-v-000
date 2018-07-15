# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(search_string)
    array = []
    if search_string == ""
      self.each do |student|
        array << student.name
      end
    else
      self.each do |student|
        /search_string/.match(student.name)
    end
  end

end
