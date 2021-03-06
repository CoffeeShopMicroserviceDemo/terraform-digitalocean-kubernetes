data "digitalocean_kubernetes_versions" "do_k8s_versions" {}

data "digitalocean_kubernetes_cluster" "k8s" {
  name = var.do_k8s_name
  depends_on = [digitalocean_kubernetes_cluster.k8s, digitalocean_kubernetes_node_pool.k8s_nodes, digitalocean_project_resources.do_project_resources]
}