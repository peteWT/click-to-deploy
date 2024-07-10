CLUSTER := superset-cluster
ZONE := us-west1-a
APP_INSTANCE_NAME := superset-patchworks
NAMESPACE := default
DEFAULT_STORAGE_CLASS := standard # provide your StorageClass name if not "standard"
SUPERSET_PERSISTENT_DISK_SIZE := 10Gi
DB_PERSISTENT_DISK_SIZE := 10Gi
PUBLIC_SERVICE_AND_INGRESS_ENABLED := false
METRICS_EXPORTER_ENABLED := false


create_clusters:
	gcloud container clusters create "${CLUSTER}" --zone "${ZONE}"

config_kubectl:
	gcloud container clusters get-credentials "${CLUSTER}" --zone "${ZONE}"

#Run this once
setup_cluster:
	kubectl apply -f "https://raw.githubusercontent.com/GoogleCloudPlatform/marketplace-k8s-app-tools/master/crd/app-crd.yaml"
