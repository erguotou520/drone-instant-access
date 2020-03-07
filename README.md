<div align="center"><img width="60%" src="./logo.png" /></div>

# Drone Instant Access(即时达)

drone instant access(即时达) 微信消息通知插件

![Go](https://github.com/erguotou520/drone-instant-access/workflows/Go/badge.svg)
![Go report](https://goreportcard.com/badge/github.com/erguotou520/drone-instant-access)
![Docker pulls](https://img.shields.io/docker/pulls/erguotou/drone-instant-access.svg)
![Docker automated build](https://img.shields.io/docker/cloud/automated/erguotou/drone-instant-access.svg)
![Docker build status](https://img.shields.io/docker/cloud/build/erguotou/drone-instant-access.svg)
![GitHub release](https://img.shields.io/github/release/erguotou520/drone-instant-access.svg)

## 简介

基于 [即时达](http://push.ijingniu.cn/) 封装的微信消息通知插件。请合理规范使用免费资源，不乱用，不作恶。

## 栗子
```yml
# 普通
---
kind: pipeline
name: default

steps:
  - name: wechat-notify
    image: erguotou/drone-instant-access
    settings:
      channel: "你订阅的即时达通道id"
      # channel:
      #   from_secret: CHANNEL
      text: "项目名称：构建结果"
      desp: "{DRONE_BUILD_STATUS} at {DRONE_REPO_BRANCH} branch"
```

### markdown格式，不建议使用，因为微信模板消息里的内容不支持markndown，只有详情支持
```yaml
---
kind: pipeline
name: default

steps:
  - name: wechat-notify
    image: erguotou/drone-instant-access
    settings:
      channel: "你订阅的即时达通道id"
      # channel:
      #   from_secret: CHANNEL
      head: "要发送的消息标题"
      body: >
        # 标题
        ![](https://i.loli.net/2020/03/07/DOibrcZqTKpmUVY.png)
        消息已推送！  
        本次构建结果{DRONE_BUILD_STATUS}
```

## Docker运行

```bash
docker run -e PLUGIN_CHANNEL=xxx -e PLUGIN_HEAD=测试标题 -e PLUGIN_BODY=测试内容 erguotou/drone-instant-access
```

## 命令行运行

从actions中下载二进制文件
```bash
PLUGIN_CHANNEL=xxx -e PLUGIN_HEAD=测试标题 -e PLUGIN_BODY=测试内容 /path/to/instant-access
```