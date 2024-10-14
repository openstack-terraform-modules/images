# images

## Configuration

> project.env

```bash 
set -a
TF_VAR_IMAGES_NOBLE_URL='["https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img","https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-arm64.img"]'
TF_VAR_IMAGES_NOBLE_ARCH='["amd64","arm64"]'
TF_VAR_IMAGES_NOBLE_OS_DISTRIBUTION='["ubuntu","ubuntu"]'
TF_VAR_IMAGES_NOBLE_OS_VERSION='["24.04","24.04"]'
set +a
```

> terraform.tf

```bash
module deployment {
    source = "git::https://github.com/openstack-terraform-modules/deployment.git"
}

module images_noble {
    source = "git::https://github.com/openstack-terraform-modules/images.git"
    deployment_id = module.deployment.id
    url = var.IMAGES_NOBLE_URL
    arch = var.IMAGES_NOBLE_ARCH
    os_distribution = var.IMAGES_NOBLE_OS_DISTRUBUTION
    os_version = var.IMAGES_NOBLE_OS_VERSION
}
```

## Output
