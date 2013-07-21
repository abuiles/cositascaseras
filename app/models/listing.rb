# -*- coding: utf-8 -*-
class Listing < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :title_store, :use => :scoped, :scope => :store

  validates_presence_of :title# , :description, :price

  belongs_to :store

  def title_store
    "#{title} de #{store.name_location}"
  end

  def location
    "Medellín, Colombia"
  end

  def store_type
    ["road", "hybrid", "touring", "fixie"].sample
  end
end
