resource "aws_instance" "web_server" {
  ami                         = "ami-083b3f53cbda7e5a4"
  associate_public_ip_address = true
  instance_type               = "t3.micro"
  #key_name = 
  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id, aws_security_group.app1-sg02-LB01.id]
  subnet_id              = aws_subnet.public-us-east-2a.id

  user_data = file("user_data.sh")

  tags = {
    Name = "web-server"
  }
}
