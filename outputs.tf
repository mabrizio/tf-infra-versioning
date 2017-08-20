output "latest_version" {
	value = "${data.external.latest_version.result.version}"
}
