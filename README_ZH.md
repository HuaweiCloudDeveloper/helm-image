<p align="center">
  <h1 align="center">Helm Kubernetes包管理器</h1>
  <p align="center">
    <a href="README.md"><strong>English</strong></a> | <strong>简体中文</strong>
  </p>
</p>

## 目录

- [仓库简介](#项目介绍)
- [前置条件](#前置条件)
- [镜像说明](#镜像说明)
- [获取帮助](#获取帮助)
- [如何贡献](#如何贡献)

## 项目介绍
‌[Helm‌](https://github.com/helm/helm) Helm 是 Kubernetes 的包管理器，用于简化应用程序的部署和管理，通过模板化、版本化和共享的“Chart”来实现。

**核心特性：**
1. 模板化部署管理：Helm使用模板化（Templates）机制动态生成Kubernetes资源配置文件（YAML），支持变量注入（Values.yaml）、条件判断和循环控制，实现应用配置与部署逻辑解耦。例如，可通过{{ .Values.replicaCount }}动态调整应用副本数，避免手动修改多环境配置。
2. 依赖依赖管理（Charts）：通过Chart定义应用及其依赖关系（如MySQL、Redis等子Chart），支持依赖版本锁定和递归更新。Chart仓库（Repository）支持集中存储和共享应用模板，例如通过helm add repo添加公共仓库并部署预置应用（如Jenkins、Nginx Ingress）。
3. 版本化与回滚（Release Management）：每次部署生成唯一版本号（Release），记录配置历史并支持一键回滚到任意历史版本（如helm rollback my-app 1）。版本差异可通过helm diff插件可视化对比，确保变更可追溯。
4. 生命周期钩子（Hooks）：支持预安装（pre-install）、后升级（post-upgrade）等钩子机制，在部署关键阶段执行自定义操作（如数据库迁移或校验）。钩子基于Kubernetes Job/CronJob实现，确保依赖服务就绪后再部署应用。
5. 值文件覆盖与多环境适配：支持通过--set命令行参数或外部值文件（Values.yaml）动态覆盖模板参数，适配开发、测试、生产等多环境配置差异。例如：helm install my-app --set image.tag=latest优先于默认值生效。
6. 安全与权限控制：集成Kubernetes RBAC，支持ServiceAccount权限细化（如限制Chart安装命名空间）。可通过helm lint校验Chart语法规范，helm verify校验Chart数字签名（基于PGP），确保部署安全性。
7. 生态与扩展性：提供插件系统（Plugins）和SDK扩展功能（如Helm Dashboard）。社区维护大量稳定Chart（如Bitnami、Azure官方库），支持自定义Chart开发并通过OCI注册表分发。
8. 声明式部署与GitOps集成：生成的Release状态存储于Kubernetes Secret/ConfigMap，兼容ArgoCD、Flux等GitOps工具，实现基于Git版本控制的持续部署（如通过HelmChart资源声明式管理应用）。

本项目提供的开源镜像商品 [**`Helm-Kubernetes包管理器`**]()，已预先安装 Helm 软件及其相关运行环境，并提供部署模板。快来参照使用指南，轻松开启“开箱即用”的高效体验吧。

**架构设计：**

![](./images/img.png)

> **系统要求如下：**
> - CPU: 4vCPUs 或更高
> - RAM: 16GB 或更大
> - Disk: 至少 50GB

## 前置条件
[注册华为账号并开通华为云](https://support.huaweicloud.com/usermanual-account/account_id_001.html)

## 镜像说明

| 镜像规格                                                                                                                            | 特性说明 | 备注 |
|---------------------------------------------------------------------------------------------------------------------------------| --- | --- |
| [Helm-3.18.6-kunpeng-v1.0](https://github.com/HuaweiCloudDeveloper/helm-image/tree/Helm-3.18.6-kunpeng-v1.0?tab=readme-ov-file) | 基于鲲鹏服务器 + Huawei Cloud EulerOS 2.0 64bit 安装部署 |  |

## 获取帮助
- 更多问题可通过 [issue](https://github.com/HuaweiCloudDeveloper/helm-image/issues) 或 华为云云商店指定商品的服务支持 与我们取得联系
- 其他开源镜像可看 [open-source-image-repos](https://github.com/HuaweiCloudDeveloper/open-source-image-repos)

## 如何贡献
- Fork 此存储库并提交合并请求
- 基于您的开源镜像信息同步更新 README.md