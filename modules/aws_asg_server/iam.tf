resource "aws_iam_role" "instance_role" {
  name               = var.webserver_instance_role
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.instance_policy.json
}

data "aws_iam_policy_document" "instance_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "instance_policy" {
  name        = var.webserver_instance_policy
  path        = "/"
  description = "IAM policy allowing webserver to describe ec2 instances and create tags"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:Describe*",
                "ec2:CreateTags"
            ],
            "Resource": "*"
        }
    ]
  }
EOF

}

resource "aws_iam_role_policy_attachment" "instance_role_ssm_attachment" {
  role       = aws_iam_role.instance_role.name
  policy_arn = aws_iam_policy.instance_policy.arn
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = var.webserver_instance_profile
  path = "/"
  role = aws_iam_role.instance_role.name
}

