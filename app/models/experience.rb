class Experience < ApplicationRecord
  enum item_type: { work: 0, education: 1 }

  belongs_to :user

end
