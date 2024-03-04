# frozen_string_literal: true

# this class related to user model
class User < ApplicationRecord
  validates :username, :email, :password, presence: true
  validates :username, length: { minimum: 5, maximum: 20 }
  validates :password, length: { minimum: 8, maximum: 30 }
end
