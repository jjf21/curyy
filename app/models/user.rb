# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  before_create :set_default_values
  after_create :add_default_content

  has_many :experiences, dependent: :destroy
  has_many :cvs, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :links, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def admin?
    email == "carl.quivron@gmail.com"
  end

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
    text = "#{first_name} #{last_name}"
    text.presence || email
  end

  private

  def set_default_values
    self.cv_email = email
    self.phone = "06 ..."
    self.address = "France"
    self.headline = "Ceo @ Twitter"
  end

  def add_default_content
    Experience.new_template(self, "work").save!
    Experience.new_template(self, "education").save!
    Skill.new_template(self, "skill").save!
    Skill.new_template(self, "tool").save!
    Skill.new_template(self, "language").save!
  end
end
