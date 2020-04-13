# terraform-aws-api-generic

This modules effectively just wraps the four `aws_api_gateway_*` resources which are used to build endpoints attached to API routes.

The module can be used directly to reduce to number of resource declarations to create an endpoint, but is also used as the basis of a number of more specialised modules to avoid the need to remember all the various parameters (especially since a large number are extremely repetative).

## Compatibility

The module is HCL2 only.