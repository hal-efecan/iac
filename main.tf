resource "null_resource" "multipass_vm" {
  provisioner "local-exec" {
    command = "bash ./start.sh"
  }

  triggers = {
    always_run = timestamp()
  }
}

