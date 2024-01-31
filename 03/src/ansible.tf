resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",

  { webservers = yandex_compute_instance.count, 
    databases = yandex_compute_instance.foreach,
    storage = yandex_compute_instance.storage[*] }
  )

  filename = "${abspath(path.module)}/hosts.cfg"
}