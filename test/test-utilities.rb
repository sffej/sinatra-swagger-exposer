module TestUtilities

  def must_raise_swag_and_match(expression, value)
    expression.must_raise(Sinatra::SwaggerExposer::SwaggerInvalidException).message.must_match(value)
  end

  def new_info(content)
    require_relative '../lib/sinatra/swagger-exposer/swagger-info'
    Sinatra::SwaggerExposer::SwaggerInfo.new(content)
  end

  def new_er(type, description, known_types = [])
    require_relative '../lib/sinatra/swagger-exposer/swagger-endpoint-response'
    Sinatra::SwaggerExposer::SwaggerEndpointResponse.new(type, description, known_types)
  end

  def new_t(type_name, type_content, known_types = [])
    require_relative '../lib/sinatra/swagger-exposer/swagger-type'
    Sinatra::SwaggerExposer::SwaggerType.new(type_name, type_content, known_types)
  end

  def new_e(type, path, parameters = [], responses = {}, summary = nil, description = nil, tags = nil)
    require_relative '../lib/sinatra/swagger-exposer/swagger-endpoint'
    Sinatra::SwaggerExposer::SwaggerEndpoint.new(type, path, parameters, responses, summary, description, tags)
  end

  def new_ep(name, description, how_to_pass, required, type, params = {}, known_types = [])
    Sinatra::SwaggerExposer::SwaggerEndpointParameter.new(name, description, how_to_pass, required, type, params, known_types)
  end

end
