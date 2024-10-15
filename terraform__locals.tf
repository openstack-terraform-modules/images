locals {
/*
    url = var.url
    arch = var.arch 
    os_distribution = var.os_distribution
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
*/
    deployment = var.deployment
    images = {
        for arch, url in var.images.data.urls : arch => url if url != null
    }
    image_name = var.images.name
    image_distribution = var.images.data.distribution
    image_version = var.images.data.version
    image_flavor = var.images.data.flavor
    image_format = var.images.data.format
}