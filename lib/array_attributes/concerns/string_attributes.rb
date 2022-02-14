# frozen_string_literal: true

module ArrayAttributes
  module Concerns
    module StringAttributes
      def string_array_attributes(attrs)
        attrs.each do |attribute|
          get_raw_value(attribute)
          assign_raw_value(attribute)
          compact_value(attribute)
        end
      end

      private

      def get_raw_value(attribute)
        define_method :"#{attribute}_raw" do
          send(attribute)&.join(', ')
        end
      end

      def assign_raw_value(attribute)
        define_method :"#{attribute}_raw=" do |values|
          assign_attributes("#{attribute}": values&.split(',')&.map(&:strip))
        end
      end

      def compact_value(attribute)
        define_method :"compact_#{attribute}" do
          assign_attributes("#{attribute}": send(attribute)&.reject(&:blank?))
        end
      end
    end
  end
end
