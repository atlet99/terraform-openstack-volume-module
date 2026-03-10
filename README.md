# Terraform Openstack Volume Module

This Terraform module creates and attaches block storage volumes to existing OpenStack instances using the OpenStack Compute (Nova) v2 API. It allows for flexible configuration of volume attachment options, including multiattach support and device tagging. This module is useful for scenarios where additional storage is needed for compute instances.

**Note:** This module requires **Terraform version 1.5.0** or higher and **OpenStack provider version 3.2.0** or higher.

## Features

- Creates a block storage volume with configurable size and type.
- Attaches the volume to a specified OpenStack instance.
- Supports optional multiattach for attaching the volume to multiple instances.
- Configurable device path, tagging, and vendor-specific options for advanced use cases.

## Usage

The following examples demonstrate how to use the module with required and optional parameters.

### Basic Usage

```hcl
module "volume-module" {
  source  = "atlet99/volume-module/openstack"
  version = "1.0.2"
  
  name        = "example-volume"
  size        = 10
  volume_type = "fast"
  instance_id = "your-instance-uuid"
}
```

### Advanced Usage with Optional Parameters

```hcl
module "volume-module" {
  source  = "atlet99/volume-module/openstack"
  version = "1.0.2"

  name          = "example-volume"
  size          = 10
  volume_type   = "multiattach"
  instance_id   = openstack_compute_instance_v2.instance.id
  device        = "/dev/vdb"
  multiattach   = true
  tag           = "data-volume"
  region        = "RegionOne"
  description   = "Data volume for application"
  metadata      = { environment = "production" }
  vendor_options = {
    ignore_volume_confirmation = true
  }
}
```

## License

This is an open source project under the [MIT](https://github.com/atlet99/terraform-openstack-volume-module/blob/master/LICENSE) license.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | ~> 3.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 3.2.0 |

## Resources

| Name | Type |
|------|------|
| [openstack_blockstorage_volume_v3.volume](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/blockstorage_volume_v3) | resource |
| [openstack_compute_volume_attach_v2.va](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/compute_volume_attach_v2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | AZ where volume's available. | `string` | `""` | no |
| <a name="input_backup_id"></a> [backup\_id](#input\_backup\_id) | The backup ID from which to create the volume | `string` | `null` | no |
| <a name="input_consistency_group_id"></a> [consistency\_group\_id](#input\_consistency\_group\_id) | The consistency group to place the volume in | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | A description of the volume | `string` | `null` | no |
| <a name="input_device"></a> [device](#input\_device) | Device path for attachment (e.g., /dev/vdc) | `string` | `null` | no |
| <a name="input_enable_online_resize"></a> [enable\_online\_resize](#input\_enable\_online\_resize) | Allows extending attached volumes | `bool` | `true` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The image ID from which to create the volume | `string` | `null` | no |
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | ID of the instance to attach the volume to | `string` | n/a | yes |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | Metadata key/value pairs to associate with the volume | `map(string)` | `{}` | no |
| <a name="input_multiattach"></a> [multiattach](#input\_multiattach) | Flag to enable multiattach | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the volume | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region for the Compute client | `string` | `null` | no |
| <a name="input_scheduler_hints"></a> [scheduler\_hints](#input\_scheduler\_hints) | Hints for Cinder scheduler | `list(map(string))` | `[]` | no |
| <a name="input_size"></a> [size](#input\_size) | Size of the volume in GB | `number` | n/a | yes |
| <a name="input_snapshot_id"></a> [snapshot\_id](#input\_snapshot\_id) | The snapshot ID from which to create the volume | `string` | `null` | no |
| <a name="input_source_replica"></a> [source\_replica](#input\_source\_replica) | The volume ID to replicate with | `string` | `null` | no |
| <a name="input_source_vol_id"></a> [source\_vol\_id](#input\_source\_vol\_id) | The volume ID from which to create the volume | `string` | `null` | no |
| <a name="input_tag"></a> [tag](#input\_tag) | Tag for the attached device | `string` | `null` | no |
| <a name="input_vendor_options"></a> [vendor\_options](#input\_vendor\_options) | Vendor-specific options for the attachment, e.g., ignore\_volume\_confirmation | `map(bool)` | <pre>{<br/>  "ignore_volume_confirmation": false<br/>}</pre> | no |
| <a name="input_volume_retype_policy"></a> [volume\_retype\_policy](#input\_volume\_retype\_policy) | Migration policy when changing volume\_type | `string` | `null` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | Type of the volume | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_attached_devices"></a> [attached\_devices](#output\_attached\_devices) | List of device paths for the attached volumes (depends on the hypervisor) |
| <a name="output_attached_instance_ids"></a> [attached\_instance\_ids](#output\_attached\_instance\_ids) | List of IDs of the instances to which the volumes are attached |
| <a name="output_attached_volume_ids"></a> [attached\_volume\_ids](#output\_attached\_volume\_ids) | List of IDs of the attached volumes |
| <a name="output_attachment_ids"></a> [attachment\_ids](#output\_attachment\_ids) | List of IDs of the volume attachments |
| <a name="output_multiattach_enabled_list"></a> [multiattach\_enabled\_list](#output\_multiattach\_enabled\_list) | List indicating if multiattach is enabled for each volume attachment |
| <a name="output_volume_attachment"></a> [volume\_attachment](#output\_volume\_attachment) | Attachment information if the volume is attached to an instance |
| <a name="output_volume_availability_zone"></a> [volume\_availability\_zone](#output\_volume\_availability\_zone) | Availability zone of the volume |
| <a name="output_volume_description"></a> [volume\_description](#output\_volume\_description) | Description of the created volume |
| <a name="output_volume_id"></a> [volume\_id](#output\_volume\_id) | ID of the created volume |
| <a name="output_volume_metadata"></a> [volume\_metadata](#output\_volume\_metadata) | Metadata key/value pairs associated with the volume |
| <a name="output_volume_name"></a> [volume\_name](#output\_volume\_name) | Name of the created volume |
| <a name="output_volume_region"></a> [volume\_region](#output\_volume\_region) | Region of the volume |
| <a name="output_volume_size"></a> [volume\_size](#output\_volume\_size) | Size of the volume in GB |
| <a name="output_volume_type"></a> [volume\_type](#output\_volume\_type) | Type of the volume |
<!-- END_TF_DOCS -->