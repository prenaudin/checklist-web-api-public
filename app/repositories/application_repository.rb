module ApplicationRepository
  def model_class
    raise 'Not Implemented'
  end

  def create(model:)
    verify_model!(model)
    model.save!
  end

  def find(id:)
    model_class.find(id)
  end

  def destroy(model:)
    verify_model!(model)
    model.destroy!
  end

  def update(model:, params:)
    verify_model!(model)
    model.update_attributes!(params)
  end

  def count
    model_class.count
  end

  private

  def verify_model!(model)
    raise "Object is not kind of #{model_class}" unless model.is_a?(model_class)
  end
end
