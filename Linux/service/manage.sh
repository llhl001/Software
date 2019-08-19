Concept {
    systemctl 命令脚本存放位置 {
        /usr/lib/systemd/system         # 系统级脚本
        /usr/lib/systemd/user           # 用户级脚本
    }
    unit 文件存放位置 {
        /lib/systemd/system             # 系统默认存放 unit 的位置
        /run/systemd/system             # 进程在运行时动态创建 unit 文件的存放目录
        /etc/systemd/system             # 用户配置 unit 存放位置
        优先级从低到高
    }
}

Query：
    服务文件：
    shell> systemctl -a list-unit-files                     # 列出所有服务的文件
    
    服务实例：
    shell> systemctl list-units                             # 列出已知的所有服务
    shell> systemctl list-sockets                           # 列出所有服务监听的端口
    shell> systemctl list-timers                            # 列出所有服务的运行时间
    shell> systemctl list-dependencies                      # 列出所有服务的依赖关系
    
    shell> systemctl --failed                                       # 查看启动失败的服务
    shell> systemctl status postfix.service                         # 显示一个服务的状态
    
Operate:
    shell> systemctl start postfix.service                          # 启动一个服务
    shell> systemctl stop postfix.service                           # 关闭一个服务
    shell> systemctl restart postfix.service                        # 重启一个服务

    shell> systemctl enable postfix.service                         # 开机时启动一个服务
    shell> systemctl disable postfix.service                        # 开机时禁用一个服务
    
Create&Update:
    
    shell> touch ~/customized.service           # 创建一个 .service 文件
    shell> vim ~/customized.service             # 编辑该文件，文件内容参考当前目录下的 customized.service 文件
    shell> cp ~/customized.service /etc/systemd/system  # 复制，/usr/lib/systemd/system 目录下存放的都是开机自启动的服务
    shell> chmod 754 /etc/systemd/system/customized.service     # 修改文件的权限
    
Delete:
    shell> rm /etc/systemd/system/customized.service    # 直接删除服务文件即可






