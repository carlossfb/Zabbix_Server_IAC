##################################################################
#_____ VIRTUAL MACHINE __________________________________________#
##################################################################
variable "key_name" {
  type        = string
  description = "KMS key pair name"
}

variable "ec2_instance" {
  type = object({
    ami                         = string
    instance_type               = string
    associate_public_ip_address = bool
  })
}