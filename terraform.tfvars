##################################################################
#_____ NETWORK __________________________________________________#
##################################################################

##################################################################
#_____ VIRTUAL MACHINE __________________________________________#
##################################################################
key_name = "key"

ec2_instance = {
  ami                         = "ami-00b9afbf6b23bd3e3"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
}