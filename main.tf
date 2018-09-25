provider "aws" {
  region = "eu-west-2"
}

# Create Security Groups

resource "aws_security_group" "allow_all" {
  name        = "${var.sg_name}"
  description = "Allow all inbound traffic"
  vpc_id      = "vpc-*****"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.sg_name}"
  }
}

# Create RDS instance
resource "aws_db_instance" "database" {
  identifier             = "${var.name}"
  allocated_storage      = "${var.size}"
  storage_type           = "gp2"
  engine                 = "${var.engine}"
  engine_version         = "${var.engine_version}"
  instance_class         = "${var.db_instance}"
  name                   = "${var.db_name}"
  username               = "${var.db_user}"
  password               = "${var.db_pass}"
  vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
}
