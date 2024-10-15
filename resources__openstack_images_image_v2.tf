resource openstack_images_image_v2 image {
    for_each = local.images

    name = local.image_name
    image_source_url = each.value
    container_format = "bare"
    disk_format = local.image_format

    properties = {
    //    "DEPLOYMENT_UUID": local.deployment.uuid,
    //    "DEPLOYMENT_ID": local.deployment.id,
    //    "architecture": each.key,
    //    "os_distro": local.image_distribution,
    //    "os_version": local.image_version,
    //    "img_config_drive": local.config_drive
    }
}
