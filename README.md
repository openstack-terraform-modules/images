# images

## Configuration

> project.env

```bash 
set -a
TF_VAR_CLUSTER_IMAGE="$(
    printf '%s' '{
        "name": "noble",
        "images": {
            "distribution": "ubuntu",
            "version": "24.04",
            "format": "qcow2",
            "urls": {
                "amd64": "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img",
                "arm64": "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-arm64.img",
                "riscv64": "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-riscv64.img"
            }
        }
    }' | pkgx jq
)"
set +a
```

> terraform.tf

```bash
module deployment {
    source = "git::https://github.com/openstack-terraform-modules/deployment.git"
}

module images_noble {
    source = "git::https://github.com/openstack-terraform-modules/images.git"

    deployment = module.deployment.config
    images = var.images
}
```

## Output
