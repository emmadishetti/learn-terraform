variable "fruits" {
  default = [
          "apple",
          "banana"
    ]
}

output "fruits" {
  value= var.fruits.first[0]
}