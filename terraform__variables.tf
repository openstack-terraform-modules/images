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
          urls = object({
            amd64 = string
            arm64 = string
            riscv64 = string
            ppc64el = string
            s390x = string
          })
        })
    })
}
