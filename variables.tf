variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string
}

variable "policy_description" {
  description = "Description for the IAM policy being created"
  type        = string
  default     = "Created by Terraform"
}

variable "statements" {
  description = "A list of nested maps for the statements and elements required to build the IAM policy"
  type = list(object({
    sid           = string
    effect        = string
    actions       = list(string)
    resources     = list(string)
    not_resources = optional(list(string))
    principals = optional(list(object({
      type        = string
      identifiers = list(string)
    })))
    condition = optional(list(object({
      test     = string
      variable = string
      values   = list(string)
    })))
  }))
  default = []
}
