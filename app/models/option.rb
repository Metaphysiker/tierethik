class Option < ApplicationRecord
has_many :account_options
has_many :accounts, :through => :account_options
belongs_to :slide

  def self.statuses
    ["suggested", "published"]
  end

  scope :published, -> { where(status: "published") }
  scope :suggested, -> { where(status: "suggested") }

end
