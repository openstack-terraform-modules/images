locals {
    url = var.url
    arch = var.arch 
    os_distribution = var.os_disribution
    os_version = var.os_version

    images = {
        for image_index, image_url in local.url : image_index => {
            url = image_url,
            name = element(
                split("/", image_url),
                length(split("/", image_url))-1
            )
            arch = element(local.arch, image_index)
            os_distribution = element(local.os_distribution, image_index)
            os_version = element(local.os_version, image_index)
        }
    }
}