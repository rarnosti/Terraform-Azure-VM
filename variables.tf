variable "EU_location" {
  type = string
  description = "EU Location"
  default = "UK South"
}

variable "US_location" {
  type = string
  description = "US Location"
  default = "UK South"
}

variable "azure_locations_map" {
    type = map
    default = {
        "US" = "East US2"
        "UK" = "UK South"
    }
}

variable "set_password" {
  type = bool
  default = false
}
