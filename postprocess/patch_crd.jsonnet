local com = import 'lib/commodore.libjsonnet';

local crd_files = [
  'traefik.containo.us_ingressroutes',
  'traefik.containo.us_ingressroutetcps',
  'traefik.containo.us_ingressrouteudps',
  'traefik.containo.us_middlewares',
  'traefik.containo.us_middlewaretcps',
  'traefik.containo.us_serverstransports',
  'traefik.containo.us_tlsoptions',
  'traefik.containo.us_tlsstores',
  'traefik.containo.us_traefikservices',
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
