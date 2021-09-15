data "digitalocean_kubernetes_versions" "do_k8s_versions" {}

data "digitalocean_kubernetes_cluster" "k8s" {
  name = var.do_k8s_name
}