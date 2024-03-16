terraform {
    backend "s3" {
        bucket = "sush.priya"
        key = "webserver"
        region = "us-east-1"
        dynamodb_table = "terraform-state-lock-dynamo"
        encrypt = true
      
    }
  
}