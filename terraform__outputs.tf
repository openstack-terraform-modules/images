output outputs {
    description = "the deployed images"
    value = jsonencode(element(openstack_images_image_v2.image.*, 0))
}

output deployment {
    value = local.deployment
}