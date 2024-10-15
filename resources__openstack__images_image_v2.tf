resource openstack_images_image_v2 image {
    for_each = local.images.data.urls

    name = local.images.name
    image_source_url = each.value
    container_format = "bare"
    disk_format = local.images.data.format

    properties = {
        "DEPLOYMENT_UUID": local.deployment.uuid,
        "DEPLOYMENT_ID": local.deployment.id,
        "ARCH": each.key,
        "OS_DISTRIBUTION": local.images.data.distribution,
        "OS_VERSION": local.images.data.version
    }
}
