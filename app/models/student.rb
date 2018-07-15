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
      self.all.each do |student|
        array << student.name
      end
    else
      binding.pry
      self.all.each do |student|
        #binding.pry
        if /#{search_string}/.match(student.name.downcase)
          binding.pry
          array << student.name
        end
      end
      binding.pry
    end
    binding.pry
    array
  end

end
