CUR_DATE=`date +'%m_%d_%Y'`

#all: build_docker_image login_to_dockerhub push_to_dockerhub

build_base_image:
	docker build --no-cache -t aka1spanky/knowengpipelines:base$(CUR_DATE) .

build_all_pipelines:
	docker build -f Dockerfile.addpipelines -t aka1spanky/knowengpipelines:$(CUR_DATE) .

login_to_dockerhub:
	docker login --username=$(username) --password=$(password)

push_to_dockerhub:
	docker push aka1spanky/knowengpipelines:base$(CUR_DATE)

