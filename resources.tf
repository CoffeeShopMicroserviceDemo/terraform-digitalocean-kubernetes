resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = var.do_k8s_name
  region  = var.do_region
  version = var.do_k8s_version

  node_pool {
    name       = var.do_k8s_pool_name
    size       = var.do_k8s_node_type
    node_count = var.do_k8s_nodes
  }
}

resource "digitalocean_kubernetes_node_pool" "k8s_nodes" {
  cluster_id = digitalocean_kubernetes_cluster.k8s.id

  name       = var.do_k8s_nodepool_name
  size       = var.do_k8s_nodepool_type
  node_count = var.do_k8s_nodepool_size
}