local com = import 'lib/commodore.libjsonnet';

local crd_files = [
  'gateway-standard-install',
  'hub.traefik.io_accesscontrolpolicies',
  'hub.traefik.io_aiservices',
  'hub.traefik.io_apiaccesses',
  'hub.traefik.io_apibundles',
  'hub.traefik.io_apicatalogitems',
  'hub.traefik.io_apiplans',
  'hub.traefik.io_apiportals',
  'hub.traefik.io_apiratelimits',
  'hub.traefik.io_apis',
  'hub.traefik.io_apiversions',
  'hub.traefik.io_managedsubscriptions',
  'traefik.io_ingressroutes',
  'traefik.io_ingressroutetcps',
  'traefik.io_ingressrouteudps',
  'traefik.io_middlewares',
  'traefik.io_middlewaretcps',
  'traefik.io_serverstransports',
  'traefik.io_serverstransporttcps',
  'traefik.io_tlsoptions',
  'traefik.io_tlsstores',
  'traefik.io_traefikservices',
];

local crds = [
  {
    name: crd_file,
    content: com.yaml_load_all(std.extVar('output_path') + '/' + crd_file + '.yaml'),
  }
  for crd_file in crd_files
];

{
  [crd.name]: std.filter(function(it) it != null, crd.content)
  for crd in crds
}
