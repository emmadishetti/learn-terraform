variable "fruits_stock" {
  default = {
    apple =200
    banana =100

  }
}

output "fruits_stock_apple" {
  value= var.fruits_stock[apple]
}