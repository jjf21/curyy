class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :set_cv_email_default

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

  def language_skills
    skills.language
  end

  def tool_skills
    skills.tool
  end

  def skill_skills
    skills.skill
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def set_cv_email_default
    self.cv_email = self.email
  end

end
