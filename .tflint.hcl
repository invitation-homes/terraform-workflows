rule "terraform_naming_convention" {
  enabled = true
}

rule "terraform_required_version" {
  enabled = true
}

rule "terraform_required_providers" {
  enabled = true
}

rule "terraform_typed_variables" {
  enabled = true
}

rule "terraform_comment_syntax" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_deprecated_index" {
  enabled = true
}

plugin "aws" {
    enabled = false
    version = "0.21.2"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}