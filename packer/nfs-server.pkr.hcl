source "googlecompute" "automation" {
  project_id   = "sandbox-cchau"
  source_image = "ubuntu-2204-jammy-v20230114"
  ssh_username = "packer"
  zone         = "europe-west9-a"
  machine_type = "e2-standard-2"
  use_iap      = false
}

build {
  name    = "nfs"
  sources = ["source.googlecompute.automation"]
  provisioner "shell" {
    expect_disconnect = true
    script = "../test.sh"
  }
}