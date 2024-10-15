output outputs {
    value = openstack_images_image_v2.image.*
    sensitive = true
}

output deployment {
    value = local.deployment
}