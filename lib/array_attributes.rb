# frozen_string_literal: true

require 'array_attributes/version'
require 'array_attributes/concerns/string_attributes'

module ArrayAttributes
  include ArrayAttributes::Concerns::StringAttributes
end

ActiveRecord::Base.extend ArrayAttributes
