resource "aws_launch_template" "app1_LT" {
  name_prefix   = "app1_LT"
  image_id      = "ami-083b3f53cbda7e5a4"  
  instance_type = "t3.micro"

  
  vpc_security_group_ids = [aws_security_group.app1-sg01-servers.id]

  user_data = base64encode(<<-EOF
#!/bin/bash
# Use this for your user data (script from top to bottom)
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

# Get the IMDSv2 token
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Background the curl requests
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/local-ipv4 &> /tmp/local_ipv4 &
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/placement/availability-zone &> /tmp/az &
curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/ &> /tmp/macid &
wait

macid=$(cat /tmp/macid)
local_ipv4=$(cat /tmp/local_ipv4)
az=$(cat /tmp/az)

echo "
<!doctype html>
<html lang=\"en\" class=\"h-100\">
<head>
<title>Details for EC2 instance</title>
</head>
<body>
<h1>AWS SAA: Christopher Brown</h1>
<h1>Dev Ops: 225.000</h1>

<br>
# insert an image or GIF
<img src="https://github.com/Casper1007/Class7-notes/blob/main/Publication1.jpg?raw=true">
<br>

<p><b>Instance Name:</b> $(hostname -f) </p>
</div>
</body>
</html>
" > /var/www/html/index.html

# Clean up the temp files
<div>
rm -f /tmp/local_ipv4 /tmp/az /tmp/macid
 EOF
  )

   tag_specifications {
    resource_type = "instance"
    tags = {
      Name    = "LB_Main"
      Service = "application1"
    Owner   = "Chris"
    State   = "Alabama"
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}