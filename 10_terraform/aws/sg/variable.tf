
variable "ssh_sg_name" {
  description = "Name of the SSH security group"
  type        = string
  default     = "ssh_sg"
}

variable "playwright_sg_name" {
  description = "Name of the Playwright security group"
  type        = string
  default     = "playwright_sg"
}