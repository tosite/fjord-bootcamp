# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  paginates_per 10
  validates :title, presence: true
  validates :author, presence: true
end
