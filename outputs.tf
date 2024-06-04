output "ec2_aws_ip" {
  description = "IP da VM criada na AWS"
  value       = aws_instance.ec2.public_ip
}


output "vm_azure_ip" {
  description = "IP da VM criada na AZURE:"
  value       = azurerm_linux_virtual_machine.criacao_vm.public_ip_address
}