local kap = import 'lib/kapitan.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.traefik;
local argocd = import 'lib/argocd.libjsonnet';

local app = argocd.App('traefik', params.namespace);

{
  traefik: app,
}
