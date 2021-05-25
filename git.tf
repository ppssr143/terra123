provider "aws"{
        region = "us-east-2"
        access_key = "AKIAXZQPUS26S5BIIQFB"
        secret_key = "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"
}
resource "aws_instance" "web" {
 # ami           = "ami-08e6b682a466887dd"
  ami           = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  #instance_type = "t2.micro"
  #key_name      = "terraform"
  key_name      = "terraform"
  user_data     = <<-EOF
                #!/bin/bash
                sudo apt-get update -y
                sudo apt install apache2 -y
                sudo systemctl enable apache2.service
                sudo systemctl start apache2.service
                sudo apt-get install git -y
                git clone https://github.com/ppssr143/terra123.git /home/ubuntu/test/
                sudo rm -rf /var/www/html/index.html
                sudo cp /home/ubuntu/test/index.html /var/www/html/
                EOF

  tags = {
    Name = "HelloWorld"
  }
}

