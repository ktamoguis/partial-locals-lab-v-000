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
    binding.pry
    array = []
    if search_string == ""
      binding.pry
      self.each do |student|
        array << student.name
      end
      binding.pry
    else
      binding.pry
      self.each do |student|
        if /.search_string./.match(student.name)
          array << student.name
        end
      end
      binding.pry
    end
    array
  end

end
