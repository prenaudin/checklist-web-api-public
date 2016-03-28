RSpec.describe ArrayOfHashesValidator do
  let(:model) do
    class Model
      include ActiveModel::Validations
      attr_accessor :array

      validates :array, array_of_hashes: true
    end
    Model.new
  end

  it 'raises an exception if the array is too long' do
    length = ArrayOfHashesValidator::MAX_ARRAY_LENGTH + 1
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

  it 'raises an exception if it is not an array of hashes' do
    model.array = ['']
    expect do
      model.validate!
    end.to raise_error(ActiveModel::ValidationError, /must be an Array/)
  end

  it 'raises an exception if a hash is too long' do
    hash_in_array = {}
    (ArrayOfHashesValidator::MAX_HASH_LENGTH + 1).times do |i|
      hash_in_array[i] = i
    end
    model.array = [hash_in_array]
    expect do
      model.validate!
    end.to raise_error(ActiveModel::ValidationError, /must be an Array/)
  end

  it 'raises an exception if a hash has an invalid key' do
    model.array = [{ Object.new => 'String' }]
    expect do
      model.validate!
    end.to raise_error(ActiveModel::ValidationError, /must be an Array/)
  end

  it 'raises an exception if a hash has an invalid value' do
    model.array = [{ 'String' => Object.new }]
    expect do
      model.validate!
    end.to raise_error(ActiveModel::ValidationError, /must be an Array/)
  end
end
