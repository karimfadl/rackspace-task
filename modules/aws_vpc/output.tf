output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnets" {
  value = aws_subnet.public_subnets.*.id
}

output "private_subnets" {
  value = aws_subnet.private_subnets.*.id
}

output "igw_id" {
  value = module.aws_internet_gateway.igw_id
}

output "public_routes" {
  value = aws_route_table.public_route.*.id
}

output "private_routes" {
  value = aws_route_table.private_route.*.id
}

output "nat_gateway_ids" {
  value = aws_nat_gateway.ngw.*.id
}

output "vpc_cidr" {
  value = var.vpc_cidr
}

