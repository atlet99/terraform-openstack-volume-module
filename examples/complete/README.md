# Complete Example

This example configures all available options in the `terraform-openstack-volume-module`.

It provisions a volume with description, metadata, scheduler hints, multiattach, device tagging, and vendor-specific options.

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
| <a name="module_complete_volume"></a> [complete\_volume](#module\_complete\_volume) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | AZ where volume is available | `string` | `""` | no |
| <a name="input_backup_id"></a> [backup\_id](#input\_backup\_id) | The backup ID from which to create the volume | `string` | `null` | no |
| <a name="input_consistency_group_id"></a> [consistency\_group\_id](#input\_consistency\_group\_id) | The consistency group to place the volume in | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | A description of the volume | `string` | `"Example volume with all options"` | no |
| <a name="input_device"></a> [device](#input\_device) | Device path for attachment (e.g., /dev/vdc) | `string` | `null` | no |
| <a name="input_enable_online_resize"></a> [enable\_online\_resize](#input\_enable\_online\_resize) | Allows extending attached volumes | `bool` | `true` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The image ID from which to create the volume | `string` | `null` | no |
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | ID of the instance to attach the volume to | `string` | `"your-instance-uuid"` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | Metadata key/value pairs to associate with the volume | `map(string)` | <pre>{<br/>  "environment": "staging",<br/>  "managed_by": "terraform"<br/>}</pre> | no |
| <a name="input_multiattach"></a> [multiattach](#input\_multiattach) | Flag to enable multiattach | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the volume | `string` | `"example-complete-volume"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region for the Compute client | `string` | `null` | no |
| <a name="input_scheduler_hints"></a> [scheduler\_hints](#input\_scheduler\_hints) | Hints for Cinder scheduler | `list(map(string))` | `[]` | no |
| <a name="input_size"></a> [size](#input\_size) | Size of the volume in GB | `number` | `20` | no |
| <a name="input_snapshot_id"></a> [snapshot\_id](#input\_snapshot\_id) | The snapshot ID from which to create the volume | `string` | `null` | no |
| <a name="input_source_replica"></a> [source\_replica](#input\_source\_replica) | The volume ID to replicate with | `string` | `null` | no |
| <a name="input_source_vol_id"></a> [source\_vol\_id](#input\_source\_vol\_id) | The volume ID from which to create the volume | `string` | `null` | no |
| <a name="input_tag"></a> [tag](#input\_tag) | Tag for the attached device | `string` | `"data-volume"` | no |
| <a name="input_vendor_options"></a> [vendor\_options](#input\_vendor\_options) | Vendor-specific options for the attachment | `map(bool)` | <pre>{<br/>  "ignore_volume_confirmation": false<br/>}</pre> | no |
| <a name="input_volume_retype_policy"></a> [volume\_retype\_policy](#input\_volume\_retype\_policy) | Migration policy when changing volume\_type | `string` | `null` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | Type of the volume | `string` | `"standard"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_attached_devices"></a> [attached\_devices](#output\_attached\_devices) | List of device paths for the attached volumes |
| <a name="output_attached_instance_ids"></a> [attached\_instance\_ids](#output\_attached\_instance\_ids) | List of IDs of the instances to which the volumes are attached |
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
