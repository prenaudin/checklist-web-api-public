RSpec.describe ArrayOfStringsValidator do
  let(:model) do
    class Model
      include ActiveModel::Validations
      attr_accessor :array

      validates :array, array_of_strings: true
    end
    Model.new
  end

  it 'raises an exception if the array is too long' do
    length = ArrayOfStringsValidator::MAX_ARRAY_LENGTH + 1
    model.array = (0..length).to_a
    expect do
      model.validate!
    end.to raise_error(ActiveModel::ValidationError, /must be an Array/)
  end

  it 'raises an exception if this not an array' do
    model.array = {}
    expect do
      model.validate!
    end.to raise_error(ActiveModel::ValidationError, /must be an Array/)
  end

  it 'raises an exception if a string is too long' do
    model.array = ['a' * (ArrayOfStringsValidator::MAX_STRING_LENGTH + 1)]
    expect do
      model.validate!
    end.to raise_error(ActiveModel::ValidationError, /must be an Array/)
  end

  it 'raises an exception if it is not an array of string' do
    model.array = [{}]
    expect do
      model.validate!
    end.to raise_error(ActiveModel::ValidationError, /must be an Array/)
  end
end
