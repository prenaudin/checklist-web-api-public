class ArrayOfStringsValidator < ActiveModel::EachValidator
  # Maximum length of the array
  MAX_STRING_LENGTH = 500
  # Maximum number of string in array
  MAX_ARRAY_LENGTH = 500
  def validate_each(record, attribute, value)
    unless value.is_a?(Array) &&
           value.length < MAX_ARRAY_LENGTH &&
           value.all? { |string| valid_string?(string) }
      record.errors.add(attribute,
                        "must be an Array (max length #{MAX_ARRAY_LENGTH})" \
                        " of String (max length #{MAX_STRING_LENGTH}) ")
    end
  end

  def valid_string?(string)
    string.is_a?(String) && string.length < MAX_STRING_LENGTH
  end
end
