output outputs {
    description = "the deployed images"
    value = {
        for k, v in openstack_images_image_v2.image.* : k => v
    }
}

output deployment {
    value = local.deployment
}