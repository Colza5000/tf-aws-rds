# tf-aws-rds

Example rds.tf file

```
module "rds" {
  source         = "../../tf-aws-rds"
  sg_name        = "test"
  name           = "test"
  size           = "20"
  engine         = "mysql"
  engine_version = "5.6"
  db_instance    = "db.t2.micro"
  db_name        = "test"
  db_user        = "test"
  db_pass        = "testing123"
}
```