# Instance profile
resource "aws_iam_instance_profile" "sample-ec2-role-instance-profile" {
  name = "sample-ec2-role-instance-profile"
  role = "${aws_iam_role.sample-ec2-role.name}"
}

resource "aws_iam_role" "sample-ec2-role" {
  name               = "sample-ec2-role"
  path               = "/"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "sample-ec2-role-policy-ssm" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = "${aws_iam_role.sample-ec2-role.name}"
}

resource "aws_iam_role_policy_attachment" "sample-ec2-ssm-logs-policy-attachment" {
  policy_arn = aws_iam_policy.sample-ec2-ssm-logs-policy.arn
  role       = "${aws_iam_role.sample-ec2-role.name}"
}

resource "aws_iam_policy" "sample-ec2-ssm-logs-policy" {
  name_prefix = "sample-ec2-ssm-logs-policy"
  path        = "/"
  description = "SSM session activity logs"

  policy = data.aws_iam_policy_document.sample-ec2-iam-policy-document.json
}

data "aws_iam_policy_document" "sample-ec2-iam-policy-document" {
  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]
    resources = [
      "arn:aws:s3:::ssm-session-logs/000000000000/*"
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetEncryptionConfiguration"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role" "sample-backup-role" {
  name               = "AWSBackupDefaultServiceRole"
  path               = "/"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "backup.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "sample-backup-role-policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = "${aws_iam_role.sample-backup-role.name}"
}

resource "aws_iam_role_policy_attachment" "sample-backup-role-policy2" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
  role       = "${aws_iam_role.sample-backup-role.name}"
}
