# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  # Add this line…
  has_many :tabs
end
