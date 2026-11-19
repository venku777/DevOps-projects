#creating volume
resource "aws_ebs_volume" "ebs" {
  availability_zone = "ap-south-1a"
  size              = 40

  tags = {
    Name = "vol-1"
  }
}

#attaching ebs volume to ec2 instance
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh" #data volume range from f-p
  volume_id   = aws_ebs_volume.ebs.id #fecthes volume id
  instance_id = aws_instance.example.id #it fecthes instance id
}