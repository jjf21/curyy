# frozen_string_literal: true

require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    experiences: Field::HasMany,
    cvs: Field::HasMany,
    visits: Field::HasMany,
    skills: Field::HasMany,
    links: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    birthdate: Field::Date,
    phone: Field::String,
    address: Field::String,
    headline: Field::String,
    about: Field::String,
    website: Field::String,
    interests: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    cv_email: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    email
    visits
    cvs
    experiences
    skills
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    email
    first_name
    last_name
    headline
    cvs
    experiences
    skills
    visits
    birthdate
    phone
    address
    about
    website
    interests
    created_at
    updated_at
    cv_email
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    experiences
    cvs
    skills
    links
    email
    first_name
    last_name
    birthdate
    phone
    address
    headline
    about
    website
    interests
    cv_email
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
