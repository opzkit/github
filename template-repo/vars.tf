variable "name" {
  type        = string
  description = "Name of repository"
}

variable "description" {
  type        = string
  description = "Short description of repository content"
}
variable "visibility" {
  type        = string
  description = "Visibility for repository, defaults to public"
  default     = "public"
}

variable "license" {
  type        = string
  description = "License template, defaults to mit"
  default     = "mit"
}
