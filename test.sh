sysctl -w vm.nr_hugepages=1024
docker run \
    -dti \
    --cpus 2 \
    --net host \
    -e THREADS=2 \
    -e ALIAS=NEW-NODE \
    jagerzhang/qubic-client
