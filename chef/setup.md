# How to install a basic version of Chef

1. Go to [Chef downloads](https://downloads.chef.io/chef) and save the target for `Red Hat Enterprise (or whichever that matches your machine)
2. In your server go:
```
wget https://packages.chef.io/files/stable/chef/13.4.24/el/7/chef-13.4.24-1.el7.x86_64.rpm
```
Then install your newly downloaded chef package:
```
sudo rpm -ivh chef-13.4.24-1.el7.x86_64.rpm
```
Then run Chef:
```
sudo chef-client --local-mode
```

Chef will start running but display a few warnings as you have no `cookbooks` present.

And that is how to start Chef simply.

# What is Chef
Chef is a configuration management and deployment tool.

# Chef Convergence

- Pre-convergence - Phase before a node is configured
  - Lint tests occur here

- Convergence - Occurs when Chef runs on the the node
  - `Providers` - What does the work to enforce the desired configuration
  - Can run over and over again without changing the configuration - This is called `idempotency`

- Post-convergence
  - Occurs after the Chef convergence
  - Verifies the nodes are configured correctly


# Chef Resources
A resource is a statement of desired configurations for a given item. This defines the state and steps for achieving this configuration

`Recipes` manage the `Resources` and are generally grouped together within a `cookbook`.

A `provider` defines the steps needed to acheive the desired state of configuration.

Chef is `idempotent`, meaning chef will only run if the desired configuration is not set. i.e. if can run over and over but Chef will not run if the configuration is in the desired state.

# Package actions

`:install` - Installs a package
`:nothing` - Does nothing
`:purge` - Removes the configuration files
`:reconfig` - Reconfigures a package
`:remove` - Removes a package
`:upgrade` - Install a package, if already installed, checked to see if it is the latest

# Service Resource Type

E.g.

```
service `httpd` do
  action [:enable, :start]
End
```

The service `httpd` is enabled at boot time.
