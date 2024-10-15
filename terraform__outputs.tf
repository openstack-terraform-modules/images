output outputs {
    value = openstack_images_image_v2.image.*
    
}

output deployment {
    value = local.deployment
}