# -*- coding: utf-8 -*-
class Store < ActiveRecord::Base
  has_many :listings
  belongs_to :user

  def admin?(user)
    self.user == user
  end

  def description
    "Vendemos cupcakes y pasteles de todos los colores y sabores Vendemos cupcakes y pasteles de todos los colores y sabores"
  end

  def price
    1000
  end

  def location
    "Medellín, Colombia"
  end

  def bicycle_type
    ["road", "hybrid", "touring", "fixie"].sample
  end
end
