output outputs {
    value = openstack_images_image_v2.image.*
    description = "the deployed images"
}

output deployment {
    value = local.deployment
}