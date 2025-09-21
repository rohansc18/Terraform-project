terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }

  backend "s3" {
    bucket = "terraform-000001"
    key    = "akas/mytffiles/terraform.tfstate"
    region = "us-east-1" 
    
    use_lockfile = true


          
  } 

}
