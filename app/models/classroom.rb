# == Schema Information
#
# Table name: classrooms
#
#  id          :integer          not null, primary key
#  course_name :string
#  semester    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Classroom < ActiveRecord::Base
  has_many :classroom_students
  has_many :students, through: :classroom_students

  def oldest_student
    students.where("birthday is not null").order("birthday asc").first
  end
end
    # students_w_birthdays = self.students.select do |student|
    #   !student.birthday.nil?
    # end
    # students_w_birthdays.sort {|student| student.birthday}