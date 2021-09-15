resource "digitalocean_project" "do_project" {
  name = var.do_project_name
}

resource "digitalocean_project_resources" "do_project_resources" {
  project = digitalocean_project.do_project.id
  resources = ["do:kubernetes:${digitalocean_kubernetes_cluster.k8s.id}"]
  depends_on = [digitalocean_project.do_project, digitalocean_kubernetes_cluster.k8s]
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name    = var.do_k8s_name
  region  = var.do_region
  version = data.digitalocean_kubernetes_versions.do_k8s_versions.latest_version

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

  depends_on = [digitalocean_kubernetes_cluster.k8s]
}

