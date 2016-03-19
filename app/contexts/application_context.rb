class ApplicationContext
  def self.call(*args)
    new(*args).call
  end

  def coerce_to_params(hash_or_params)
    if hash_or_params.is_a?(ActionController::Parameters)
      hash_or_params
    else
      ActionController::Parameters.new(hash_or_params.to_h)
    end
  end
end
