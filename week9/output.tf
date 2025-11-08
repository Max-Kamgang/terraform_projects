output "my-ip-address" {
  value = aws_lightsail_instance.server1.public_ip_address

}
output "ssh-command" {
  value = "ssh -i lampstackkey.pem ${aws_lightsail_instance.server1.username}@${aws_lightsail_instance.server1.public_ip_address}"

}