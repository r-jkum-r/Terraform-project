<<<<<<< HEAD
# provider "aws" {
#     region = "us-east-1"
# }
# resource "random_id" "suffix" {
#   byte_length = 4
# }


# resource "aws_key_pair" "node_key" {
#     key_name = "node-key"
#     public_key = file("node-key.pub")
# }

# resource "aws_default_vpc" "default" {

# }

# resource "aws_security_group" "my_sg" {
#     name = "my_sg_group"
#     description = "Allow SSH, HTTP and Jenkins"
#     vpc_id = aws_default_vpc.default.id

#     ingress {
#         from_port =80
#         to_port =80
#         protocol ="tcp"
#         cidr_blocks =["0.0.0.0/0"]
#     }
#     ingress {
#         from_port =22
#         to_port =22
#         protocol ="tcp"
#         cidr_blocks =["0.0.0.0/0"]
#     }
#     ingress {
#         from_port =8080
#         to_port =8080
#         protocol ="tcp"
#         cidr_blocks =["0.0.0.0/0"]
#     }
#     ingress {
#         from_port =3000
#         to_port =3000
#         protocol ="tcp"
#         cidr_blocks =["0.0.0.0/0"]
#     }

#     egress {
#         from_port =0
#         to_port =0
#         protocol ="-1"
#         cidr_blocks =["0.0.0.0/0"]
#     }
#     tags = {
#         Name = "automate-sg"
#     }
# }



# resource "aws_instance" "node-app" {
#     ami = "ami-084568db4383264d4"
#     instance_type = "t2.micro"
#     key_name = aws_key_pair.node_key.key_name
#     vpc_security_group_ids = [aws_security_group.my_sg.id]

#     root_block_device {
#         volume_size =20
#         volume_type ="gp3"
#     }
#     tags = {
#         Name = "terra_server"
#     }

# }

# resource "aws_s3_bucket" "my_bucket" {
#     bucket = "tterra-rj-bt-${random_id.suffix.hex}"
#     tags = {
#         Name = "MyNodeBucket"
#     }
# }

# resource "aws_s3_bucket_versioning" "versioning" {
#     bucket = aws_s3_bucket.my_bucket.id

#     versioning_configuration {
#         status = "Enabled"
#     }
# }

# resource "aws_s3_bucket_public_access_block" "public_block" {
#     bucket = aws_s3_bucket.my_bucket.id

    
#     block_public_acls   = true
#     block_public_policy = true
#     ignore_public_acls  = true
#     restrict_public_buckets = true
# }
=======
provider "aws" {
    region = "us-east-1"
}
resource "random_id" "suffix" {
  byte_length = 4
}


resource "aws_key_pair" "node_key" {
    key_name = "node-key"
    public_key = file("node-key.pub")
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_sg" {
    name = "my_sg_group"
    description = "Allow SSH, HTTP and Jenkins"
    vpc_id = aws_default_vpc.default.id

    ingress {
        from_port =80
        to_port =80
        protocol ="tcp"
        cidr_blocks =["0.0.0.0/0"]
    }
    ingress {
        from_port =22
        to_port =22
        protocol ="tcp"
        cidr_blocks =["0.0.0.0/0"]
    }
    ingress {
        from_port =8080
        to_port =8080
        protocol ="tcp"
        cidr_blocks =["0.0.0.0/0"]
    }
    ingress {
        from_port =3000
        to_port =3000
        protocol ="tcp"
        cidr_blocks =["0.0.0.0/0"]
    }

    egress {
        from_port =0
        to_port =0
        protocol ="-1"
        cidr_blocks =["0.0.0.0/0"]
    }
    tags = {
        Name = "automate-sg"
    }
}



resource "aws_instance" "node-app" {
    ami = "ami-084568db4383264d4"
    instance_type = "t2.micro"
    key_name = aws_key_pair.node_key.key_name
    vpc_security_group_ids = [aws_security_group.my_sg.id]

    root_block_device {
        volume_size =20
        volume_type ="gp3"
    }
    tags = {
        Name = "terra_server"
    }

}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "tterra-rj-bt-${random_id.suffix.hex}"
    tags = {
        Name = "MyNodeBucket"
    }
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.my_bucket.id

    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_public_access_block" "public_block" {
    bucket = aws_s3_bucket.my_bucket.id

    
    block_public_acls   = true
    block_public_policy = true
    ignore_public_acls  = true
    restrict_public_buckets = true
}
>>>>>>> fc2fe07 (Initial clean push)
