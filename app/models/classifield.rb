class Classifield < ActiveRecord::Base
  # with an attributes
  geocoded_by :address # address is an attribute of MyModel

  # or with a method
  geocoded_by :full_address # full_address is a method which take some model's attributes to get a formatted address for example

  # the callback to set longitude and latitude
  after_validation :geocode

  # the full_address method
  def full_address
    "#{address}, #{zipcode}, #{city}, #{country}"
    end
end
