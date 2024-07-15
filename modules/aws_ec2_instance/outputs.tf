output "id" {
  value = aws_instance.main.*.id
}

output "availability_zone" {
  value = aws_instance.main.*.availability_zone
}

output "key_name" {
  value = aws_instance.main.*.key_name
}

output "public_dns" {
  value = aws_instance.main.*.public_dns
}

output "public_ip" {
  value = aws_instance.main.*.public_ip
}

output "ipv6_addresses" {
  value = aws_instance.main.*.ipv6_addresses
}

output "private_ip" {
  value = aws_instance.main.*.private_ip
}

output "security_groups" {
  value = aws_instance.main.*.security_groups
}

output "vpc_security_group_ids" {
  value = aws_instance.main.*.vpc_security_group_ids
}

output "subnet_id" {
  value = aws_instance.main.*.subnet_id
}

output "root_block_device" {
  value = aws_instance.main.*.root_block_device
}

