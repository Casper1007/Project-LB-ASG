#These are   for  public

resource "aws_subnet" "public-us-east-2a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.32.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-2a"
    Service = "application1"
    Owner   = "Chris"
    State   = "Alabama"
  }
}

resource "aws_subnet" "public-us-east-2b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.32.2.0/24"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-2b"
    Service = "application1"
    Owner   = "Chris"
    State   = "Alabama"
  }
}


resource "aws_subnet" "public-us-east-2c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.32.3.0/24"
  availability_zone       = "us-east-2c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-us-east-2c"
    Service = "application1"
    Owner   = "Chris"
    State   = "Alabama"
  }
}

#these are for private
resource "aws_subnet" "private-us-east-2a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.32.11.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name    = "private-us-east-2a"
    Service = "application1"
    Owner   = "Chris"
    State   = "Alabama"
  }
}

resource "aws_subnet" "private-us-east-2b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.32.12.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name    = "private-us-east-2b"
    Service = "application1"
    Owner   = "Chris"
    State   = "Alabama"
  }
}


resource "aws_subnet" "private-us-east-2c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.32.13.0/24"
  availability_zone = "us-east-2c"

  tags = {
    Name    = "private-us-east-2c"
    Service = "application1"
    Owner   = "Chris"
    State   = "Alabama"
  }
}