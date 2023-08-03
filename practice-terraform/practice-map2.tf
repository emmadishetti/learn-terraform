variable "fruits_stock_with_price" {
  default = {
    apple = {
      stock =100
      price =50
    }
    banana = {
      stock =200
      price =100
    }
    }
}

output "fruits_stock_with_price_banana" {
  value= var.fruits_stock_with_price["banana"].price [apple].price
}