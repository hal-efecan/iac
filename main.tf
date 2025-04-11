resource "null_resource" "multipass_vm" {
  provisioner "local-exec" {
    command = <<-EOT
      set -e
      echo "Launching Multipass VM..."
      bash ./scripts/single.sh
      echo "Installing Docker inside VM..."
      bash ./scripts/docker.sh
      echo "Installing Portianer inside VM..."
      bash ./scripts/portainer.sh
      echo "Setup complete!"
    EOT
    interpreter = ["/bin/bash", "-c"]
  }

  triggers = {
    script_hash = "${filemd5("./scripts/single.sh")}${filemd5("./scripts/docker.sh")}${filemd5("./scripts/portainer.sh")}"
  }
}