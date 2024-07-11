CLUSTER := superset-patchworks
ZONE := us-west1-a


create_clusters:
	gcloud container clusters create "${CLUSTER}" --zone "${ZONE}"

config_kubectl:
	gcloud container clusters get-credentials "${CLUSTER}" --zone "${ZONE}"

#Run this once
setup_cluster:
	kubectl apply -f "https://raw.githubusercontent.com/GoogleCloudPlatform/marketplace-k8s-app-tools/master/crd/app-crd.yaml"
