resource "tls_private_key" "gl_rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "gl_kp" {
  key_name   = "kp-${var.project}"
  public_key = tls_private_key.gl_rsa_key.public_key_openssh

  depends_on = [
    tls_private_key.gl_rsa_key
  ]
}

resource "local_file" "gl_rsa_private_key" {
  content         = tls_private_key.gl_rsa_key.private_key_pem
  filename        = "${path.module}/main.pem"
  file_permission = 600

  depends_on = [
    tls_private_key.gl_rsa_key
  ]
}
