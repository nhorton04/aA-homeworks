class Cat < ApplicationRecord
  # has_many :toys
  include Toyable
end
