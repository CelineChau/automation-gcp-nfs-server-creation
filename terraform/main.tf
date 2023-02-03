# Custom image
data "google_compute_image" "my_image" {
  name = "packer-1675269685"
}

# Attached disk
resource "google_compute_disk" "default_disk" {
  name  = "nfs-server-disk-1"
  type  = "pd-ssd"
  zone  = "europe-west1-b"
  image = "${data.google_compute_image.my_image.self_link}"
}

# Create instance with image packer created
resource "google_compute_instance" "vm_1" {
  name         = "nfs-server-vm-1"
  machine_type = "e2-medium"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2204-lts"
      size  = "1000"
      type  = "pd-ssd"
    }
  }

  metadata = {}

  # Run startup script
  metadata_startup_script = "${file("./startup-script.sh")}"

  network_interface {
    network = "default"
    access_config {}
  }
}

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.default_disk.id
  instance = google_compute_instance.vm_1.id
}
