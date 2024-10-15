resource openstack_images_image_v2 image {
    for_each = local.images

    name = local.image_name
    image_source_url = each.value
    container_format = "bare"
    disk_format = local.image_format

    properties = {
        "DEPLOYMENT_UUID": local.deployment.uuid,
        "DEPLOYMENT_ID": local.deployment.id,
        "ARCH": each.key,
        "OS_DISTRIBUTION": local.image_distribution,
        "OS_VERSION": local.image_version
    }
}
