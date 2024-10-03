resource "aws_instance" "gl_ec2" {
  ami                    = var.ami_id
  instance_type          = "t3a.medium"
  key_name               = aws_key_pair.gl_kp.key_name
  vpc_security_group_ids = [aws_security_group.gl_sg.id]

  root_block_device {
    encrypted   = true
    volume_size = 30
    volume_type = "gp3"
    iops        = 3000
    throughput  = 125

    tags = {
      Name = "ebs-${var.project}"
    }
  }

  tags = {
    Name = "ec2-${var.project}"
  }

  depends_on = [
    aws_key_pair.gl_kp,
    aws_security_group.gl_sg
  ]
}
