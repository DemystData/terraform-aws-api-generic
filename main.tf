resource "aws_api_gateway_method" "method" {
  rest_api_id        = var.api_id
  resource_id        = var.resource_id
  http_method        = var.http_method
  authorization      = var.authorization
  request_parameters = var.method_request_parameters
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = var.api_id
  resource_id             = var.resource_id
  http_method             = aws_api_gateway_method.method.http_method
  integration_http_method = var.integration_http_method
  type                    = var.type
  uri                     = var.uri
  credentials             = var.credentials
  request_templates       = var.request_templates
  request_parameters      = var.integration_request_parameters
}

resource "aws_api_gateway_integration_response" "integration_response" {
  count = length(var.responses)

  rest_api_id        = var.api_id
  resource_id        = var.resource_id
  http_method        = aws_api_gateway_method.method.http_method
  status_code        = var.responses[count.index].status_code
  selection_pattern  = lookup(var.responses[count.index], "selection_pattern", null)
  response_templates = lookup(var.responses[count.index], "templates", {})
  response_parameters = zipmap(
    lookup(var.responses[count.index], "parameters", []),
    lookup(var.responses[count.index], "param_values", [])
  )
}

resource "aws_api_gateway_method_response" "method_response" {
  count = length(var.responses)

  rest_api_id = var.api_id
  resource_id = var.resource_id
  http_method = aws_api_gateway_method.method.http_method
  status_code = var.responses[count.index].status_code
  response_parameters = zipmap(
    lookup(var.responses[count.index], "parameters", []),
    lookup(var.responses[count.index], "param_requires", [])
  )
  response_models = lookup(var.responses[count.index], "models", {})
}