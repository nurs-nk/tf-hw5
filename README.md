In AWS console create VPC.
  create - "production-vpc"
  create - "cidr_block" = "10.0.0.0/24"

In AWS console create 2 public, 2 private subnets in 2 different availability zones for high availability.
  create - "public-production-1a" "cidr_block" = "10.0.0.0/26"
  create - "public-production-1b" "cidr_block" = "10.0.0.64/26"
  create - "production-vpc"

In AWS console create internet gateway.
  create - "production-igw"
  create - "production-vpc"
  
In AWS console create route table with route 0.0.0.0/0 to IGW and associate this table with both public subnets.
  create - "production-rtb"
  add "route"!
  assosiate two public subnet to route-table!
  
  
