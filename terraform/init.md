# Terraform Basics

# Initialise

```
terraform init
```

As of Terraform version 0.10.0, each "Provider" is its own encapsulated binary distributed separately from Terraform itself. The terraform init command will automatically download and install any Provider binary for the providers in use within the configuration, which in this case is just the aws.

```
terraform plan
```

See what will be executed without applying the changes.

```
terraform apply
```

Apply terraform changes. This also includes name changes etc.

```
terraform show
```

Inspect current state.


```
terraform destroy
```
Destroy your setup.
