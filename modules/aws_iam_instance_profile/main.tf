data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    sid     = ""
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    effect = "Allow"

    actions = [
      "ec2:*",
      "ssm:*",
      "s3:*"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role" "instance_role" {
  name               = "${var.name}_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "assume_role" {
  name   = "${var.name}_iam_role_policy"
  role   = aws_iam_role.instance_role.id
  policy = data.aws_iam_policy_document.policy_document.json
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.name}_instance_profile"
  role = aws_iam_role.instance_role.name
}
