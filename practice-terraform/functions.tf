lookup(map, key, default)


> lookup({a="ay", b="bee"}, "a", "what?")
ay
> lookup({a="ay", b="bee"}, "c", "what?")
what?


module "rabbitmq" {
source           = "git::https://github.com/emmadishetti/tf-module-rabbitmq.git"
tags             = var.tags
env              = var.env
ami              = var.ami
zone_id          = var.zone_id

for_each = var.rabbitmq

sg_ingress_cidr  = local.app_subnets_cidr
ssh_ingress_cidr = var.ssh_ingress_cidr
subnet_ids       = local.db_subnets
vpc_id           = local.vpc_id
instance_type    = each.value["instance_type"]
}





