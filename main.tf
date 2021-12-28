resource "aws_iam_policy" "this" {
  name        = var.policy_name
  policy      = data.aws_iam_policy_document.this.json
  description = var.policy_description
}

data "aws_iam_policy_document" "this" {

  dynamic "statement" {
    for_each = var.statements
    content {
      sid           = lookup(statement.value, "sid", null)
      effect        = lookup(statement.value, "effect", "Allow")
      actions       = lookup(statement.value, "actions")
      resources     = lookup(statement.value, "resources", "[*]")
      not_resources = lookup(statement.value, "not_resources", null)

      dynamic "principals" {
        for_each = statement.value.principals == null ? [] : statement.value.principals
        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      dynamic "condition" {
        for_each = statement.value.condition == null ? [] : statement.value.condition
        content {
          test     = condition.value.test
          variable = condition.value.variable
          values   = condition.value.values
        }
      }
    }
  }
}