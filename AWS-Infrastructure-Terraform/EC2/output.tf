output "instance_id" {
  value = aws_instance.example.id
}

output "public_ip" {
  value = aws_instance.example.public_ip
}
output "private_ip" {
  value = aws_instance.example.private_ip
}
output "key_pair_name" {
 value = aws_key_pair.deployer.key_name
}