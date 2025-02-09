resource "aws_vpc" "this" {
  instance_tenancy = "default"
  cidr_block = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge ( var.commontags, {
    Name=local.resource
  }, var.vpc_tags)
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
  tags = merge (
    var.commontags,
    {Name=local.resource},var.igwtags)
  
}

resource "aws_subnet" "public" {
  count=length(var.public_subnet)
  vpc_id = aws_vpc.this.id
  cidr_block = var.public_subnet[count.index]
  availability_zone = local.az_names[count.index]
   map_public_ip_on_launch = true

   tags = merge(var.commontags,var.public_subnet_tags,
   {Name="${local.resource}-public-${local.az_names[count.index]}"})
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidr)
  vpc_id = aws_vpc.this.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge(var.commontags,var.private_subnet_cidr_tags,
  {Name="${local.resource}-private-${local.az_names[count.index]}"})
}

resource "aws_subnet" "Database_cidr" {
  count = length(var.Database_cidr)
  vpc_id = aws_vpc.this.id
  cidr_block = var.Database_cidr[count.index]
  availability_zone = local.az_names[count.index]
  tags = merge(var.commontags,var.Database_cidrtags,{
    Name="${local.resource}-database-${local.az_names[count.index]}"
  })
}

resource "aws_route_table" "publicroute" {
  vpc_id = aws_vpc.this.id
  tags = merge(var.commontags,var.puroute_tags,
  {Name="${local.resource}-publicroute"})
}

resource "aws_route_table" "privateroute" {
  vpc_id = aws_vpc.this.id
  tags = merge(var.commontags,var.prroute_tags,
  {Name="${local.resource}-privateroute"})
}
resource "aws_route_table" "Dbroute" {
  vpc_id = aws_vpc.this.id
  tags = merge(var.commontags,var.Dbroutetags,
  {Name="${local.resource}-Dbroute"})
}

resource "aws_eip" "nat" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route" "publicway" {
  route_table_id = aws_route_table.publicroute.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
  }

  resource "aws_route" "privateway" {
    route_table_id = aws_route_table.privateroute.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ngw.id
  }

  resource "aws_route" "Dbway" {
    route_table_id = aws_route_table.Dbroute.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  resource "aws_route_table_association" "publicassoc" {
    count=length(var.public_subnet)
    route_table_id = aws_route_table.publicroute.id
    subnet_id = aws_subnet.public[count.index].id
  }

  resource "aws_route_table_association" "privateassoc" {
    count=length(var.private_subnet_cidr)
    route_table_id = aws_route_table.privateroute.id
    subnet_id = aws_subnet.private[count.index].id
  }
  resource "aws_route_table_association" "Databaseassoc" {
    count=length(var.Database_cidr)
    route_table_id = aws_route_table.Dbroute.id
    subnet_id = aws_subnet.Database_cidr[count.index].id
  }

  