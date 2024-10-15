resource openstack_images_image_v2 image {
    for_each = local.images

    name = local.image_name
    image_source_url = each.value
    container_format = "bare"
    disk_format = local.image_format

    #
    # https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/images_image_v2#properties
    #
    # do not set **os_** properties managed by openstack
    properties = {
        "DEPLOYMENT_UUID": local.deployment.uuid,
        "DEPLOYMENT_ID": local.deployment.id,
        "ARCHITECTURE": each.key,
        "DISTRIBUTION": local.image_distribution,
        "VERSION": local.image_version
    }
}
