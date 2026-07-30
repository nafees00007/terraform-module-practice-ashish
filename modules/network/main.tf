locals {
  prefix = "${var.project_name}-${var.env}"
}

resource "google_compute_network" "vpc" {

  name = "${local.prefix}-vpc"

  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public" {

  count = length(var.public_subnets)

  name = "${local.prefix}-public-subnet-${count.index + 1}"

  ip_cidr_range = var.public_subnets[count.index]

  region = var.region

  network = google_compute_network.vpc.id
}

resource "google_compute_subnetwork" "private" {

  count = length(var.private_subnets)

  name = "${local.prefix}-private-subnet-${count.index + 1}"

  ip_cidr_range = var.private_subnets[count.index]

  region = var.region

  network = google_compute_network.vpc.id
}
