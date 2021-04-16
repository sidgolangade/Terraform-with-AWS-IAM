provider "aws" {
    region = "eu-west-1"
}

resource "aws_iam_user" "admin-user" {
    name = "siddhant"
    tags = {
        Description = "DevOps Team Lead"
    }
}

resource "aws_iam_policy" "adminuser" {
    name = "AdminUsers"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "siddhant-admin-access" {
    user = aws_iam_user.admin-user.name
    policy_arn = aws_iam_policy.adminuser.arn
}