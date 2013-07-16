# -*- coding: utf-8 -*-
class Listing < ActiveRecord::Base
  belongs_to :store

  def description
    "Vendemos cupcakes y pasteles de todos los colores y sabores Vendemos cupcakes y pasteles de todos los colores y sabores"
  end

  def price
    1000
  end

  def location
    "Medellín, Colombia"
  end

  def store_type
    ["road", "hybrid", "touring", "fixie"].sample
  end
end
