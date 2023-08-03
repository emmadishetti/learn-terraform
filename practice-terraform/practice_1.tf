variable "fruits" {
  default = [
   "apple"
    "banana"
]
}

output "fruit_name" {
  value = var.fruits_first["0"]
}
