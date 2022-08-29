# `terraform` and `multipass`

Provisioning multipass instances with terraform. The reader is presumed to be familiar with terraform already.

## What's in Here?

Super-simple terraform example of instantiating a multipass instance using terraform.


### Create an Instance

The usual:
1. `$ terraform plan`
2. `$ terraform apply`
```bash
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

multipass_instance_name = "sample"
```

### Access the instance

**Note**: Notice that we are _not_ using `ssh` from the CLI here. This is because our sample `terra-cloud-init.yml`
does not set up any user keys. Doing so This so is left as an exercise to the reader.

```bash
$ multipass shell $(terraform output -raw multipass_instance_name)
```

Or, since you already know the name, we can be more terse 😊:

```bash
$ multipass shell sample
```

## Acknowledgements
* [terraform multipass provider](https://registry.terraform.io/providers/larstobi/multipass)