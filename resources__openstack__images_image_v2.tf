resource openstack_images_image_v2 image {
    for_each = local.images

    name = each.value.name
    image_source_url = each.value.url
    container_format = "bare"
    disk_format = "qcow2"

    properties = {
        "DEPLOYMENT_UUID": local.deployment_uuid,
        "DEPLOYMENT_ID": local.deployment_id,
        "ARCH": each.value.arch,
        "OS_DISTRIBUTION": each.value.os_distribution,
        "OS_VERSION": each.value.os_version
    }
}