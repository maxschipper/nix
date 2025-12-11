{
  services.tailscale.extraSetFlags = [
    "--accept-dns=false"
    "--advertise-routes"
    "10.0.0.0/30"
  ]; # nuc for tailnet devices to reach it with the *.nuc.lab dns rewrite in adguard home needed for internal domain routing, as dns rewerite points to local ip 10.0.0.2 # also include 10.0.0.1, the router
}
