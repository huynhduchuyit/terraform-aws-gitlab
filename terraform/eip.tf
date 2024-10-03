resource "aws_eip" "gl_eip" {
  instance = aws_instance.gl_ec2.id

  tags = {
    Name = "eip-${var.project}"
  }

  depends_on = [
    aws_instance.gl_ec2
  ]
}
