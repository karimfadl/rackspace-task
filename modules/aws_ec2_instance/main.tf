data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["${var.ami_name_filter}*"]
  }

  owners = [var.ami_owner]

  name_regex = "^${var.ami_name_filter}.*${var.ami_additional_regex}"
}

module "instance_profile" {
  source = "../aws_iam_instance_profile"
  name   = "${var.name}_profile"
}

resource "aws_instance" "main" {
  count                  = var.instance_count
  ami                    = data.aws_ami.ami.image_id
  instance_type          = var.instance_size
  key_name               = var.key_name
  monitoring             = var.monitoring
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = element(
    distinct(compact(concat([var.subnet_id], var.subnet_ids))),
    count.index,
  )

  iam_instance_profile = module.instance_profile.name
  user_data            = var.user_data
  ebs_optimized        = var.ebs_optimized

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = var.root_delete_on_termination
  }

  lifecycle {
    ignore_changes = [
      ami,
      ebs_optimized,
    ]
    #https://github.com/hashicorp/terraform/issues/3116
    #prevent_destroy = "${var.instance_prevent_destroy}"
  }

  tags = merge(
    {
      "Name" = var.instance_count > 1 || var.use_num_suffix == "true" ? format("%s-%d", var.name, count.index + 1) : var.name
    },
    var.tags,
  )
}

