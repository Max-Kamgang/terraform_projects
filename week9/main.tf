// Generate Key pair for lightsail instance
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_lightsail_key_pair" "key" {
  name       = "lampstackkey"
  public_key = tls_private_key.example.public_key_openssh

}
resource "local_file" "keypem" {
  content         = tls_private_key.example.private_key_pem
  filename        = "lampstackkey.pem"
  file_permission = 0400
}

resource "aws_lightsail_instance" "server1" {
  name              = "lampserver"
  availability_zone = "us-east-1a"
  bundle_id         = "small_2_0"
  blueprint_id      = "centos_stream_9"
  key_pair_name     = aws_lightsail_key_pair.key.name
 
  tags = {
    Name = "lampserver"
    env  = "dev"
  }

}
