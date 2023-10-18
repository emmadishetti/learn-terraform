lookup(map, key, default)


> lookup({a="ay", b="bee"}, "a", "what?")
ay
> lookup({a="ay", b="bee"}, "c", "what?")
what?






module "elasticache" {
source = "git::https://github.com/emmadishetti/tf-module-elasticache.git"
tags   = var.tags
env    = var.env

for_each = var.elasticache

subnet_ids      = local.db_subnets
vpc_id          = local.vpc_id
sg_ingress_cidr = local.app_subnets_cidr

elasticache_type       = each.value["elasticache_type"]
port                   = each.value["port"]
family                 = each.value["family"]
engine                 = each.value["engine"]
engine_version         = each.value["engine_version"]
num_cache_nodes        = each.value["num_cache_nodes"]
node_type              = each.value["node_type"]

}

module "rabbitmq" {
source = "git::https://github.com/emmadishetti/tf-module-rabbitmq.git"
tags   = var.tags
env    = var.env
ami             = var.ami
zone_id         = var.zone_id
ssh_ingress_cidr = var.ssh_ingress_cidr

for_each = var.rabbitmq

sg_ingress_cidr = local.app_subnets_cidr
subnet_ids      = local.db_subnets
vpc_id          = local.vpc_id
instance_type   = each.value["instance_type"]


}