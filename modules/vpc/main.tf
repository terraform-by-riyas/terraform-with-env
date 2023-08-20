resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.env}-public_subnet"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "${var.env}-IG"
  }
}

resource "aws_route_table" "to-gw" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.env}-to-internet"
  }
}

// below block explicitly associate the  table with the subnet
resource "aws_route_table_association" "public_subnet_asso" {
  count          = length(aws_subnet.public.cidr_block)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.to-gw.id
}