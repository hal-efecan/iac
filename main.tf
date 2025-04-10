resource "null_resource" "multipass_vm" {
  provisioner "local-exec" {
    command = "bash ./single.sh"
  }

  triggers = {
    always_run = timestamp()
  }
}

