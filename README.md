# qubic-client
qubic-client Docker 版本，因为挖这个需要运气，因此用Docker来启动可以快速将服务器资源分割成多个节点来挖，挖到的概率可能有所提升。还有一种场景，就是有的云服务器只允许你用 90% 的CPU，这就很尴尬，物理运行会损失CPU性能，用Docker则可以任意指定CPU资源，还支持小数！
# 快速启动
```
# 调整分页，否则会提示 Trainer: WARNING: Free number of hugepages is smaller than needed, have: 0 - want: 104 (52 x number of threads). Falling back to use malloc memory.
# 分页大小计算公式为：总挖矿线程数 x 52
sysctl -w vm.nr_hugepages=1024

# 启动容器
docker run \
    -dti \
    --cpus 2 \   # 指定CPU个数，支持小数
    --net host \
    -e THREADS=2 \
    -e ALIAS=NEW-NODE \
    -e TOKEN=eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJJZCI6IjliNGRhMjE4LTMxMTctNGZiZC1hMTA3LWU1NDdiM2FiYTM5MCIsIk1pbmluZyI6IiIsIm5iZiI6MTcwOTA5NjYwMCwiZXhwIjoxNzQwNjMyNjAwLCJpYXQiOjE3MDkwOTY2MDAsImlzcyI6Imh0dHBzOi8vcXViaWMubGkvIiwiYXVkIjoiaHR0cHM6Ly9xdWJpYy5saS8ifQ.kxhLFKwDHDsyQhVt2GChj1ROzupM7QcFdT0LbX14XmDp09RvpN54T4sGRF7dvHf7bZOagc_nEMR6wkN3SofOUQ \
    jagerzhang/qubic-client
```

`注：TOKEN换成你自己的即可`

# 环境变量

- `THREADS`：自定义线程数，不传入默认为2
- `ALIAS`：别名，不传默认为本地IP地址
- `TOKEN`：Qubic Token，不传入就会给我挖咯...
- `AUTO_UPDATE_ENABLED`：是否开启自动升级，默认为true，开启，设置为false则关闭
- `IFNAME`：指定需要获取IP地址的网卡，默认为 eth0，主要用于自动获取IP地址作为别名

