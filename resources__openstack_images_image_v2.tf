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
    tags = [
        format("DEPLOYMENT_UUID=%s", local.deployment.uuid),
        format("DEPLOYMENT_ID=%s", local.deployment.id),
        format("ARCHITECTURE=%s", each.key),
        format("DISTRIBUTION=%s", local.image_distribution),
        format("VERSION=%s", local.image_version),
        format("FLAVOR=%s", local.image_flavor)
    ]
}
