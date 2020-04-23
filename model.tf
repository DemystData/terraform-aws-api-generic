resource "aws_api_gateway_model" "model" {
  count = var.model == "Empty" ? 0 : 1

  rest_api_id  = var.api_id
  name         = join("", regexall("[a-zA-Z0-9]", var.name))
  description  = "Model Template for ${var.name}"
  content_type = "application/json"

  schema = var.model
}