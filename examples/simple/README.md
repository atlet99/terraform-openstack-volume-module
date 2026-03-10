# Simple Example

This example demonstrates how to create a basic volume and attach it to an instance using the `terraform-openstack-volume-module`.

It creates a volume with minimal required parameters and attaches it to a specified instance.

## Usage

To apply this example, run:

```bash
terraform init
terraform apply
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | >= 3.2.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_simple_volume"></a> [simple\_volume](#module\_simple\_volume) | ../../ | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_attachment_ids"></a> [attachment\_ids](#output\_attachment\_ids) | List of IDs of the volume attachments |
| <a name="output_volume_id"></a> [volume\_id](#output\_volume\_id) | ID of the created volume |
| <a name="output_volume_name"></a> [volume\_name](#output\_volume\_name) | Name of the created volume |
<!-- END_TF_DOCS -->
