output "vm_ip" {
  description = "Ip da sua VM"
  value       = aws_instance.vm.public_ip
}