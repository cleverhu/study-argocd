image-server:
	podman build -t registry.cn-hangzhou.aliyuncs.com/test-argocd/server:v1  \
	-f ./build/images/server/Dockerfile . \
	--platform=linux/amd64,linux/arm64
push-image-server:
	podman push registry.cn-hangzhou.aliyuncs.com/test-argocd/server:v1

root: image-server push-image-server