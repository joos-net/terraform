resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


resource "null_resource" "web_hosts_provision" {
  #Ждем создания инстанса
  depends_on = [yandex_compute_instance.count, yandex_compute_instance.foreach, yandex_compute_instance.storage]
  #Костыль!!! Даем ВМ 60 сек на первый запуск. Лучше выполнить это через wait_for port 22 на стороне ansible
  # # В случае использования cloud-init может потребоваться еще больше времени
  provisioner "local-exec" {
    command = "sleep 60"
  }
  #Запуск ansible-playbook
  provisioner "local-exec" {
    # without secrets
    command     = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i ${abspath(path.module)}/hosts.cfg ${abspath(path.module)}/test.yml"
    
    on_failure  = continue #Продолжить выполнение terraform pipeline в случае ошибок
    environment = { ANSIBLE_HOST_KEY_CHECKING = "False" } #срабатывание триггера при изменении переменных
  }
  triggers = {
    always_run        = "${timestamp()}"                         #всегда т.к. дата и время постоянно изменяются
    #playbook_src_hash = file("${abspath(path.module)}/test.yml") # при изменении содержимого playbook файла
    #ssh_public_key    = local.ssh-keys                         # при изменении переменной with ssh
    #template_rendered = "${local_file.hosts_templatefile.content}" #при изменении inventory-template
    #password_change = jsonencode( {for k,v in random_password.each: k=>v.result})
  }
}