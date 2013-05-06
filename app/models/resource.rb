class Resource < ActiveRecord::Base
  attr_accessible :name, :resource_description, :resource_link, :resource_name
end
