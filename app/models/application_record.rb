# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :recent, -> { reorder(created_at: :desc) }
end
