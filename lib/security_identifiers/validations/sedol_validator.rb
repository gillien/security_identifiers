module SecurityIdentifiers
  module Validations
    class SedolValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        sedol = SEDOL.new(value)

        record.errors[attribute] << 'does not have a valid check digit' unless sedol.valid?
      rescue SecurityIdentifiers::InvalidFormat
        record.errors[attribute] << 'is not in the correct format'
      end
    end
  end
end
