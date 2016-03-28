class ArrayOfHashesValidator < ActiveModel::EachValidator
  PERMITTED_VALUE_TYPES = ActionController::Parameters::PERMITTED_SCALAR_TYPES
  PERMITTED_KEY_TYPES   = ActionController::Parameters::PERMITTED_SCALAR_TYPES
  # Maximum length of the array
  MAX_ARRAY_LENGTH = 500
  # Maximum hash length in array
  MAX_HASH_LENGTH = 10
  def validate_each(record, attribute, value)
    unless value.is_a?(Array) &&
           value.length < MAX_ARRAY_LENGTH &&
           value.all? { |hash| valid_hash?(hash) }
      record.errors.add(attribute,
                        "must be an Array (max length #{MAX_ARRAY_LENGTH})" \
                        " of Hashes (max length #{MAX_HASH_LENGTH}) with" \
                        " key types #{PERMITTED_KEY_TYPES} and value types" \
                        " #{PERMITTED_VALUE_TYPES}")
    end
  end

  def valid_hash?(hash)
    hash.is_a?(Hash) &&
      hash.length < MAX_HASH_LENGTH &&
      hash.values
          .all? { |value| PERMITTED_VALUE_TYPES.include?(value.class) } &&
      hash.keys.all? { |key| PERMITTED_KEY_TYPES.include?(key.class) }
  end
end
