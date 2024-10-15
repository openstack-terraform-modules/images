variable deployment {
    type = object({
      id = string
      uuid = string
      tenant_name = string
    })
}
variable images {
    description = "A multi-arch image to upload"
    type = object({
        name = string
        data = object({
          distribution = string
          version = string
          format = string
          config_drive = optional(string)
          urls = object({
            amd64 = string
            arm64 = optional(string)
            riscv64 = optional(string)
            ppc64el = optional(string)
            s390x = optional(string)
          })
        })
    })
}
