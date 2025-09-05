# Standard Platform - Terraform Module 🚀🚀
<p align="right"><a href="https://partners.amazonaws.com/partners/0018a00001hHve4AAC/GoCloud"><img src="https://img.shields.io/badge/AWS%20Partner-Advanced-orange?style=for-the-badge&logo=amazonaws&logoColor=white" alt="AWS Partner"/></a><a href="LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-green?style=for-the-badge&logo=apache&logoColor=white" alt="LICENSE"/></a></p>

Welcome to the Standard Platform — a suite of reusable and production-ready Terraform modules purpose-built for AWS environments.
Each module encapsulates best practices, security configurations, and sensible defaults to simplify and standardize infrastructure provisioning across projects.

## 📦 Module: Terraform DocumentDB Module
<p align="right"><a href="https://github.com/gocloudLa/terraform-aws-wrapper-documentdb/releases/latest"><img src="https://img.shields.io/github/v/release/gocloudLa/terraform-aws-wrapper-documentdb.svg?style=for-the-badge" alt="Latest Release"/></a><a href=""><img src="https://img.shields.io/github/last-commit/gocloudLa/terraform-aws-wrapper-documentdb.svg?style=for-the-badge" alt="Last Commit"/></a><a href="https://registry.terraform.io/modules/gocloudLa/wrapper-documentdb/aws"><img src="https://img.shields.io/badge/Terraform-Registry-7B42BC?style=for-the-badge&logo=terraform&logoColor=white" alt="Terraform Registry"/></a></p>
The Terraform Wrapper for DocumentDB simplifies the configuration of MongoDB-compatible Database Services on the AWS cloud. This wrapper functions as a predefined template, facilitating the creation and management of DocumentDB clusters by handling all technical details.

### ✨ Features

- 🌐 [DNS Record](#dns-record) - Registers a CNAME DNS record in a Route53 hosted zone



### 🔗 External Modules
| Name | Version |
|------|------:|
| <a href="https://github.com/terraform-aws-modules/terraform-aws-security-group" target="_blank">terraform-aws-modules/security-group/aws</a> | 5.3.0 |



## 🚀 Quick Start
```hcl
documentdb_parameters = {
  "00" = {
    subnets = data.aws_subnets.public.ids
    # vpc_name    = "" # Default: ${local.common_name} (dmc-prd)

    master_username = "user"
    master_password = "password"

    # Optional: By default, the port is open to the VPC CIDR
    # ingress_with_cidr_blocks = [
    #   {
    #     rule        = "mongodb-27017-tcp"
    #     cidr_blocks = "0.0.0.0/0"
    #     description = "Enable all access"
    #   }
    # ]
    dns_records = {
      "" = {
        zone_name    = "${local.zone_public}"
        private_zone = false
      }
    }
  }
}

documentdb_defaults = var.documentdb_defaults
```


## 🔧 Additional Features Usage

### DNS Record
Register a CNAME DNS record in a Route53 hosted zone that is present within the account, which can be public or private depending on the desired visibility type of the record.


<details><summary>Configuration Code</summary>

```hcl
dns_records = {
  "" = {
    zone_name    = local.zone_private
    private_zone = true
  }
}
```


</details>




## 📑 Inputs
| Name                | Description                                                 | Type     | Default                                                          | Required |
| ------------------- | ----------------------------------------------------------- | -------- | ---------------------------------------------------------------- | -------- |
| create_enable       | Enables or disables the creation of the DocumentDB cluster  | `bool`   | `true`                                                           | no       |
| database_name       | Name of the DocumentDB database                             | `string` | `"${local.common_name}-${each.key}"`                             | no       |
| cluster_identifier  | Identifier for the DocumentDB cluster                       | `string` | `"${local.common_name}-${each.key}"`                             | no       |
| master_username     | Master username for the database                            | `string` | `lookup(each.value, "master_username")`                          | no       |
| master_password     | Master password for the database                            | `string` | `lookup(each.value, "master_password")`                          | no       |
| storage_encrypted   | Enables storage encryption for the database                 | `bool`   | `"true"`                                                         | no       |
| deletion_protection | Enables deletion protection for the DocumentDB cluster      | `bool`   | `"true"`                                                         | no       |
| instance_class      | Instance class for DocumentDB instances                     | `string` | `"db.t3.medium"`                                                 | no       |
| security_group_ids  | List of security group IDs for the DocumentDB cluster       | `list`   | `[module.security_group_documentdb[each.key].security_group_id]` | no       |
| subnets             | List of subnets where DocumentDB instances will be deployed | `list`   | `lookup(each.value, "subnets", null)`                            | no       |
| instances           | Number of DocumentDB instances to be created                | `number` | `lookup(each.value, "instances", 1)`                             | no       |
| vpc_name            | (optional) Custom VPC Name                                  | `string` | ``${local.common_name}` (dmc-prd)`                               | no       |
| tags                | A map of tags to assign to resources.                       | `map`    | `{}`                                                             | no       |








---

## 🤝 Contributing
We welcome contributions! Please see our contributing guidelines for more details.

## 🆘 Support
- 📧 **Email**: info@gocloud.la

## 🧑‍💻 About
We are focused on Cloud Engineering, DevOps, and Infrastructure as Code.
We specialize in helping companies design, implement, and operate secure and scalable cloud-native platforms.
- 🌎 [www.gocloud.la](https://www.gocloud.la)
- ☁️ AWS Advanced Partner (Terraform, DevOps, GenAI)
- 📫 Contact: info@gocloud.la

## 📄 License
This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details. 