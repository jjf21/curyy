class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :experiences
  has_many :cvs
  has_many :skills
  has_many :links

  def work_experiences
    experiences.work
  end

  def education_experiences
    experiences.education
  end

end
