/*----------------------------------------------------------------------*/
/* Common |                                                             */
/*----------------------------------------------------------------------*/

variable "metadata" {
  type = any
}

/*----------------------------------------------------------------------*/
/* ALB | Variable Definition                                            */
/*----------------------------------------------------------------------*/

variable "documentdb_parameters" {
  type        = any
  description = ""
  default     = {}
}

variable "documentdb_defaults" {
  description = "Map of default values which will be used for each item."
  type        = any
  default     = {}
}
