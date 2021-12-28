# Terraform IAM policy module

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.43.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.43.0 |

## Basic Usage

```hcl
module "iam_policy" {
  source = "./modules/iam-policy"

  policy_name         = "some_name"
  policy_description  = "Some description"
  statements         = [
    {
      sid        = "AllowS3"
      effect     = "Allow"
      actions    = [               
        "s3:ListBucket"
        "s3:GetObject",
        "s3:PutObject",
      ]
      resources  = ["*"]
    }
  ]
}
```

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_policy_description"></a> [policy\_description](#input\_policy\_description) | Description for the IAM policy being created | `string` | `"Created by Terraform"` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | The name of the IAM policy | `string` | n/a | yes |
| <a name="input_statements"></a> [statements](#input\_statements) | A list of nested maps for the statements and elements required to build the IAM policy | <pre>list(object({<br>    sid           = string<br>    effect        = string<br>    actions       = list(string)<br>    resources     = list(string)<br>    not_resources = optional(list(string))<br>    principals = optional(list(object({<br>      type        = string<br>      identifiers = list(string)<br>    })))<br>    condition = optional(list(object({<br>      test     = string<br>      variable = string<br>      values   = list(string)<br>    })))<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_output"></a> [output](#output\_output) | IAM policy attributes |
