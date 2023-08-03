variable "fruits" {
  default = [
          "apple",
          "banana"
    ]
}

output "fruits_first" {
  value= var.fruits[0]
}