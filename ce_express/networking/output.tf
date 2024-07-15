output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "igw_id" {
  value = module.vpc.igw_id
}

output "public_routes" {
  value = module.vpc.public_routes
}

output "private_routes" {
  value = module.vpc.private_routes
}

output "nat_gateway_ids" {
  value = module.vpc.nat_gateway_ids
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

