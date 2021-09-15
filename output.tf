output "k8s_cluster_name" {
  value = digitalocean_kubernetes_cluster.k8s.name
}

output "do_project_id" {
  value = digitalocean_project.do_project.id
}

output "k8s_versions" {
  value = data.digitalocean_kubernetes_versions.do_k8s_versions.latest_version
}