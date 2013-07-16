# -*- coding: utf-8 -*-
class Store < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :name_location, use: :slugged

  def name_location
    "#{name} en #{location}"
  end

  has_many :listings
  belongs_to :user

  def admin?(user)
    self.user == user
  end

  def price
    1000
  end

  def bicycle_type
    ["road", "hybrid", "touring", "fixie"].sample
  end
end
