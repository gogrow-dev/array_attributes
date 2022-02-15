# frozen_string_literal: true

module ArrayAttributes
  module Concerns
    module StringAttributes
      def string_array_attributes(attrs, opts = {})
        attrs.each do |attribute|
          get_raw_value(attribute)
          assign_raw_value(attribute, opts)
        end
      end

      private

      def get_raw_value(attribute)
        define_method :"#{attribute}_raw" do
          send(attribute)&.join(', ')
        end
      end

      def assign_raw_value(attribute, opts)
        define_method :"#{attribute}_raw=" do |values|
          return unless values.present?

          new_values = values.split(',').map(&:strip)

          new_values.reject!(&:blank?) if opts[:reject_blank] == true

          reject_if = opts[:reject_if]
          new_values.reject! { |v| reject_if.call(v) } if reject_if.is_a?(Proc)

          assign_attributes("#{attribute}": new_values)
        end
      end
    end
  end
end
