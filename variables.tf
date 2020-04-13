variable "api_id" {}

variable "resource_id" {}

variable "http_method" {}

variable "integration_http_method" {
  default = null
}

variable "type" {}

variable "uri" {
  default = null
}

variable "credentials" {
  default = null
}

variable "authorization" {
  default     = "NONE"
}

variable "method_request_parameters" {
  type        = map
  default     = {}
}

variable "integration_request_parameters" {
  type        = map
  default     = {}
}

variable "request_templates" {
  type        = map
  default     = {}
}

variable "responses" {
  type        = list
  default     = []
}