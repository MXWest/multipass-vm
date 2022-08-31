# multipass-mvm
Local cloud-ish type environments with [Canonical's `multipass`](https://multipass.run/). This is intended as an academic exercise.

### Pre-requisites
* [`multipass`](https://multipass.run/install) 
* [`jq`](https://stedolan.github.io/jq/download/)

### In this repository
* `mvm` a script wrapping some common `multipass` tasks. The reader is invited to examine this script to learn `multipass` itself more completely.
* [`terraform`](./terraform) Examples of managing multipass instances with `terraform`. Consult the [README](terraform/README.md) in that folder for details.

#### Setting Up
* Move the `cloud-init-sample.yml` file to `cloud-init.yml` (this is the name of the cloud-init known to the `mvm` script).
* Add your ssh key to the `users.name.ssh_authorized_keys` path in your `cloud-init.yml`
* Run `mvm` without any options to get some help
```bash
$ mvm help
    Usage: mvm [launch|start|stop|hosts|list|mount|purge] machine-name
        launch  launch a new machine named 'machine-name'
        start   [re]start machine named 'machine-name'
        stop    stop machine named 'machine-name'
        hosts   /etc/hosts style list of mDNS names and associated IPs
        list    list all machines
        mount   prints out a suggested mount command - doesn't actually _do_ anything.
        purge   stop, delete, and purge named machine
```
#### Launch an Instance
```bash
$ mvm launch my-first-mp
Launched: my-first-mp
```

#### `ssh` into your instance
Because we have installed `avahi-daemon` in our instance, we can use [mDNS](https://www.rfc-editor.org/rfc/rfc6762) names to access the instance.
```bash
$ ssh ubuntu@my-first-mp.local
...
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@my-first-mp:~$ 
```

#### List Instances

`list` prints a list of all instances and their state. Uses `jq` to pretty-print output.

```bash
$ mvm list
{
  "list": [
    {
      "ipv4": [
        "192.168.64.12"
      ],
      "name": "my-first-mp",
      "release": "20.04 LTS",
      "state": "Running"
    }
  ]
}
```

## Acknowledgements
* [Canonical `multipass` Docs](https://multipass.run/)
* [cloud-init Documentation](https://cloudinit.readthedocs.io/en/latest/)
* [Using Multipass with cloud-init](https://medium.com/@ahmadb/using-multipass-with-cloud-init-bc4b92ad27d9) by Ahmad Bilal
