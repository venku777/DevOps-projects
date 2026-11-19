#creating s3 bucket
resource "aws_s3_bucket" "s3" {
  bucket = "terraform-a5-bucket-123" #bucket name should be unique

}

#enable bucket versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

#disable public access
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#upload an object into s3 bucket
resource "aws_s3_object" "object" {
  bucket = "aws_s3_bucket.s3.id"
  key    = "VENKATESH A C 18.pdf" #object name
  source = "c:/Users/USER/OneDrive/Documents/VENKATESH A C 18.pdf"

  
}