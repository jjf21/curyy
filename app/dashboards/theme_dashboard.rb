require "administrate/base_dashboard"

class ThemeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    cvs: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    body_bg: Field::String,
    main_color: Field::String,
    text_color: Field::String,
    font_family: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    header_bg: Field::String,
    body_bg_pattern: Field::String,
    font_size: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    cvs
    id
    name
    body_bg
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    cvs
    id
    name
    body_bg
    main_color
    text_color
    font_family
    created_at
    updated_at
    header_bg
    body_bg_pattern
    font_size
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    cvs
    name
    body_bg
    main_color
    text_color
    font_family
    header_bg
    body_bg_pattern
    font_size
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

  # Overwrite this method to customize how themes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(theme)
  #   "Theme ##{theme.id}"
  # end
end
