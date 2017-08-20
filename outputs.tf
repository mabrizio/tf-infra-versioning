output "infra_version" {
	value = "${data.external.latest_version.result.infra_version}"
}
