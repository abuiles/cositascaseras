# -*- coding: utf-8 -*-
class Store < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :name_location, use: :slugged

  validates_presence_of :name, :store_type, :description, :image, :location# , :phone_number, :contact_email, :delivery_options, :payment_options

  has_many :listings
  belongs_to :user

  def name_location
    "#{name} en #{location}"
  end


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
