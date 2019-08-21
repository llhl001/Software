创建一个 gradle 空项目 {
    shell> mkdir GradleDemo
    shell> cd GradleDemo
    shell> gradle init
    shell> gradle init --type java-library  # 使用项目模板创建目录
    
    # 以下是创建的目录结构  
    .
    ├── build.gradle    # gradle 的构建脚本
    ├── settings.gradle # gradle 的配置文件
    ├── gradle
    │   └── wrapper
    │       ├── gradle-wrapper.jar  # wrapper 用于下载 gradle distribution 的 jar 包
    │       └── gradle-wrapper.properties # 配置文件，指定 wrapper 运行时的行为
    ├── gradlew # 用 wrapper 构建项目的脚本， *nux 下的 
    └── gradlew.bat # 用 wrapper 构建项目的脚本， windows 下的 
}

在原先只有 gradle 的项目中创建 gradle wrapper {
    shell> gradle wrapper  // 之后所有 shell> gradle 命令都可以用 shell> ./gradlew 或 shell> ./gradlew.bat 替换
}

Task {
    shell> ./gradlew tasks --all                # help 分组下面的所有任务都是  gradle 自带的任务


    shell> ./gradlew taskName                   # 执行一个 gradle task，多模块时，则运行所有项目的 taskName 任务
    shell> ./gradlew :mySubproject:taskName     # 执行一个多模块项目的 task，注意是在 root 模块中执行，如果已经在子模块中，直接使用上面的
    shell> ./gradlew task1 task2                # 执行多个任务
    shell> ./gradlew dist --exclude-task test   # 执行 dist 任务，排除依赖任务 test ，即不执行 test 任务
    
    #### Build-in Task
    shell> ./gradlew tasks                         # 列出你所在项目下的所有 task，只显示分过组的 task
    shell> ./gradlew tasks --all                   # 上面命令只会列出所有被分到特定 task group 中的任务，该命令则显示所有 task
    shell> ./gradlew help --task taskName          # 显示 task 的用法
    
    shell> ./gradlew projects                      # 列出你所在项目下的所有 subProject
    shell> ./gradlew properties                    # 查看当前项目的所有属性
    shell> ./gradlew model                          # 查看软件模型报告

    # Dependency
    shell> ./gradlew taskName --scan               # 查看当前任务的依赖
    shell> ./gradlew dependencies                  # 查看当前所在目录的项目的依赖
    shell> ./gradlew buildEnviorment               # 查看构建时的依赖
    shell> ./gradlew dependencyInsight             # 提示你所需要的依赖
    
    
}


################################ Gradle 命令行的使用， 
    shell> gralde [taskName1 taskName2 ...] [--optionName1=value1 --optionName2 --no-optionName3]
    # 多任务 用 space 分隔
    # 有值的 option 用 = 号赋值
    # 无值的 option 前面加 --no- 表示相反的操作
    shell> gradle taskName --console=plain --build-cache --no-build-cache --help
    
    # 多模块项目构建时，在 rootProject 目录下执行命令
    shell> gradle :mySubProject:taskName # 会执行子模块的任务
    shell> gradle taskName  # 会为所有 project（包括 root 和 sub project） 执行该任务
    
    # 进入 subProject 目录后执行命令
    shell> cd muSubProject 
    shell> gradle taskName # 只会执行 subProject 的任务
    # 注意 上面这条命令 替换成 gradlew 是如下形式的别搞错了
    shell> ../gradlew taskName
    
    
    # 不包括某一个 task 
    shell> gradle taskName --exclude-task otherTaskName
    shell> gradle taskName -rerun-tasks   # 修改完任务，还是按原来的任务执行
    shell> gradle taskName --continue # 当执行时，遇到错误时继续执行，以便查看是否其他地方还有错误
    
    
    ##### gradle 约定好应该存在的任务
    shell> gradle clean # 清除 build 目录下的内容
    shell> gradle build # 构建项目
    shell> gradle run   # 执行构建好的项目
    
    shell> gradle check # 执行所有验证类型呢的 task

   
    
    
    
    
