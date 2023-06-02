terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.26.0"
    }
  }
}

module "template" {
  source = "./template-repo"

  description = "Template repository for Terraform modules"
  name        = "tf-template"
}

module "example" {
  depends_on = [module.template]
  source     = "./tf-repo"

  description         = "some text"
  name                = "example"
  template            = true
  template_owner      = var.github_owner
  template_repository = module.template.template_repo
}

module "terraform-aws-aurora-mysql" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-aurora-mysql"
}

module "terraform-aws-aurora-postgresql" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-aurora-postgresql"
}

module "terraform-aws-dns-validated-certificate" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-dns-validated-certificate"
}

module "terraform-aws-elasticache-redis" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-elasticache-redis"
}

module "terraform-aws-k8s" {
  source = "./tf-repo"

  description = "Module for creating Kubernetes clusters using kOps"
  name        = "terraform-aws-k8s"
}

module "terraform-aws-k8s-addons-argocd" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-k8s-addons-argocd"
}

module "terraform-aws-k8s-addons-cluster-autoscaler" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-k8s-addons-cluster-autoscaler"
}

module "terraform-aws-k8s-addons-external-dns" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-k8s-addons-external-dns"
}

module "terraform-aws-k8s-addons-external-secrets-operator" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-k8s-addons-external-secrets-operator"
}

module "terraform-aws-k8s-addons-fluentbit" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-k8s-addons-fluentbit"
}

module "terraform-aws-k8s-addons-github-runners" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-k8s-addons-github-runners"
}

module "terraform-aws-k8s-addons-grafana-agent-operator" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-k8s-addons-grafana-agent-operator"
}

module "terraform-aws-k8s-argocd-cluster-secret" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-k8s-argocd-cluster-secret"
}

module "terraform-aws-k8s-network" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-k8s-network"
}

module "terraform-aws-kops-state-store" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-kops-state-store"
}

module "terraform-aws-rds-instance-mysql" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-rds-instance-mysql"
}

module "terraform-aws-rds-instance-postgresql" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-aws-rds-instance-postgresql"
}

module "terraform-cloudamqp-rabbitmq" {
  source = "./tf-repo"

  description = ""
  name        = "terraform-cloudamqp-rabbitmq"
}


#
#
#module "nodeamqp" {
#  source = "./tf-repo"
#
#  description = ""
#  name        = "nodeamqp"
#}
#
#module "govulncheck-action" {
#  source = "./tf-repo"
#
#  description = ""
#  name        = "govulncheck-action"
#}

#module "auth0" {
#  source = "./tf-repo"
#
#  description = ""
#  name        = "auth0"
#}
#
#module "opzkit_github_io" {
#  source = "./tf-repo"
#
#  description = ""
#  name        = "opzkit.github.io"
#}
#
#module "terraform-aws-k8s-addons-external-secrets" {
#  source = "./tf-repo"
#
#  description = ""
#  name        = "terraform-aws-k8s-addons-external-secrets"
#}
#
#
#module "terraform-aws-k8s-aws-lb-role-fix" {
#  source = "./tf-repo"
#
#  description = ""
#  name        = "terraform-aws-k8s-aws-lb-role-fix"
#}
#
#
#
#
#module "argocd-bootstrap-template" {
#  source = "./tf-repo"
#
#  description = ""
#  name        = "argocd-bootstrap-template"
#}
