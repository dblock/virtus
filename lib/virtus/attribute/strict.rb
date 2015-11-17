module Virtus
  class Attribute
    # Attribute extension which raises CoercionError when coercion failed
    #
    module Strict
      # @see [Attribute#coerce]
      #
      # @raises [CoercionError] when coercer failed
      #
      # @api public
      def coerce(*)
        output = super

        if value_coerced?(output) || !required? && output.nil?
          output
        else
          fail CoercionError.new(output, self)
        end
      end
    end # Strict
  end # Attribute
end # Virtus
