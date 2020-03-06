# Drone Instant Access(即时达)

drone instant access(即时达) 微信消息通知插件

## 简介

基于 [即时达](http://push.ijingniu.cn/) 封装的微信消息通知插件

## 栗子
```yml
# 普通
---
kind: pipeline
name: default

steps:
  - name: wechat-notify
    image: erguotou520/drone-instant-access
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
    image: erguotou520/drone-instant-access
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