//comando para verificar o nome da chave criada na aws
# aws ec2 describe-key-pairs
data "aws_key_pair" "existing_key" {
  key_name = "key"
}
resource "aws_instance" "web" {
  count         = 3
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.existing_key.key_name
  tags = {
    Name = "AnsibleInstance"
  }
}

