resource "kubernetes_namespace" "ingress" {
  count = var.install_ingress ? 1 : 0
  metadata {
    name = "ingress"
  }
}

resource "helm_release" "ingress" {
  depends_on = [kubernetes_namespace.ingress]
  count      = var.install_ingress ? 1 : 0

  name      = "ingress-nginx"
  namespace = "ingress"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  // enable to avoid node forwarding
  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }
}

resource "kubernetes_namespace" "cert_manager" {
  count = var.install_cert_manager ? 1 : 0
  metadata {
    name = "cert-manager"
  }
}

resource "helm_release" "cert_manager" {
  depends_on = [kubernetes_namespace.cert_manager]
  count      = var.install_cert_manager ? 1 : 0

  name      = "cert-manager"
  namespace = "cert-manager"

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "kubectl_manifest" "cluster_issuer" {
  depends_on = [helm_release.cert_manager]
  count      = var.install_cert_manager ? 1 : 0

  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    email: noreply@mail.com
    server: "https://acme-v02.api.letsencrypt.org/directory"
    privateKeySecretRef:
      name: letsencrypt-prod
    solvers:
    - http01:
        ingress:
          class: nginx
YAML
}