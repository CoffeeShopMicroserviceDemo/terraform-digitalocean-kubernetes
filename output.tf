output "k8s_cluster_name" {
  value = digitalocean_kubernetes_cluster.k8s.name
  depends_on = [digitalocean_kubernetes_cluster.k8s]
}

output "do_project_id" {
  value = digitalocean_project.do_project.id
  depends_on = [digitalocean_project.do_project]
}

output "k8s_versions" {
  value = data.digitalocean_kubernetes_versions.do_k8s_versions.latest_version
}