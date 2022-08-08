# F5-XC-AWS-NAMESPACE

This repository consists of Terraform templates to bring create a F5XC namespace.

## Usage

- Clone this repo with: `git clone --recurse-submodules https://github.com/cklewar/f5-xc-namespace`
- Enter repository directory with: `cd f5-xc-namespace`
- Obtain F5XC API certificate file from Console and save it to `cert` directory
- Pick and choose from below examples and add mandatory input data and copy data into file `main.tf.example`.
- Rename file __main.tf.example__ to __main.tf__ with: `rename main.tf.example main.tf`
- Initialize with: `terraform init`
- Apply with: `terraform apply -auto-approve` or destroy with: `terraform destroy -auto-approve`

### Example Output

```bash
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.f5xc_namespace.null_resource.next will be created
  + resource "null_resource" "next" {
      + id = (known after apply)
    }

  # module.f5xc_namespace.time_sleep.wait_n_seconds will be created
  + resource "time_sleep" "wait_n_seconds" {
      + create_duration = "5s"
      + id              = (known after apply)
    }

  # module.f5xc_namespace.volterra_namespace.namespace will be created
  + resource "volterra_namespace" "namespace" {
      + id          = (known after apply)
      + name        = "ck-test-03"
      + tenant_name = (known after apply)
      + uid         = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.
module.f5xc_namespace.volterra_namespace.namespace: Creating...
module.f5xc_namespace.volterra_namespace.namespace: Creation complete after 2s [id=dbfcb611-1c1c-446c-bd09-115768fa49a3]
module.f5xc_namespace.time_sleep.wait_n_seconds: Creating...
module.f5xc_namespace.time_sleep.wait_n_seconds: Creation complete after 5s [id=2022-08-08T15:30:43Z]
module.f5xc_namespace.null_resource.next: Creating...
module.f5xc_namespace.null_resource.next: Creation complete after 0s [id=60269692252584444]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
```

## Create F5XC Namespace

```hcl
module "f5xc_namespace" {
  source              = "./modules/f5xc/namespace"
  f5xc_api_p12_file   = "./api-creds.p12"
  f5xc_api_url        = "https://playground.staging.volterra.us/api"
  f5xc_namespace_name = "my-namespace-01"
}
```