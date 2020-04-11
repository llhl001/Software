# POST 发送 json 数据，POST 必须大写
shell> curl -X POST -H 'Content-Type:application/json' -d '{"tags":["bpm","unitmail"],"logLevel":2,"msg":"test"}'  http://localhost:8190/Log


# 下载文件
shell> curl -C - -o output.zip url      # 其中 -C 后面的 - 是表示从原来位置断点续传
