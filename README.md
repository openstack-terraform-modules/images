# images

## Documentations

https://docs.openstack.org/glance/latest/admin/useful-image-properties.html

## Configuration

> project.env

```bash 
set -a
TF_VAR_IMAGES="$(
    printf '%s' '{
        "name": "noble",
        "description":  "Ubuntu 24.04 - Noble Server",
        "images": {
            "type": "linux",
            "distribution": "ubuntu",
            "version": "24.04",
            "format": "qcow2",
            "config_drive": "optional",
            "urls": {
                "amd64": "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img",
                "arm64": "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-arm64.img",
                "riscv64": "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-riscv64.img"
            }
        }
    }' | pkgx jq^1.7 --compact-output
)"
set +a
```

> terraform.tf

```bash
module deployment {
    source = "git::https://github.com/openstack-terraform-modules/deployment.git"
}

module images {
    source = "git::https://github.com/openstack-terraform-modules/images.git"

    deployment = module.deployment.outputs
    images = jsondecode(var.IMAGES)
}
```

## Output
