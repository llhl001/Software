# 运行一个 java 程序
    shell> cd $JAVA_HOME/bin
    shell> ./java -jar myapp.jar        # 启动一个 jvm 实例，运行一个 ./myapp.jar 文件
    shell> java -jar .\procyon-decompiler.jar %%a -o .\source # 运行一个 jar 包，后面的是该 jar 包运行传入的参数
    shell> ./java kasei.HelloWorld      # 启动一个 jvm 实例，运行一个 ./kasei/HelloWorld.class 文件
    
  
# jvm 启动参数分类
#   1. 标准参数（-），所有的JVM实现都必须实现这些参数的功能，而且向后兼容；
#   2. 非标准参数（-X），默认jvm实现这些参数的功能，但是并不保证所有jvm实现都满足，且不保证向后兼容；
#   3. 非Stable参数（-XX），此类参数各个jvm实现会有所不同，将来可能会随时取消，需要慎重使用；
# 查看 jvm 启动参数 
    shell> ./java -XX:+PrintFlagsInitial >> AllBootParam.txt   # 查看所有 jvm 启动参数
    shell> ./java -classpath    # java 命令默认会根据 CLASSPATH 环境变量 中的路径寻找 .class 文件， CLASSPATH=.:%JAVA_HOME%/lib
                                # -classpath 告诉 jvm 运行时所有文件的加载路径，设置该参数后将使 CLASSPATH 环境变量失效，
                                # 如果 CLASSPATH 和 -classpath 都不存在，jvm 默认使用当前目录(./)作为类搜索路径
    shell> ./java -javaagent:/root/agent.jar  # 加载 java 变成语言代理
    
    # Debug 方式启动 jvm 
    # Debug 模式：Attach to remote JVM : jvm 监听一个 debug 端口，等待 client 连接
    # suspend=n     表示如果没有 debug client 连接，jvm 不会挂起，而是会执行代码
    # suspend=n     表示如果没有 debug client 连接，jvm 会挂起，确保 client 连接后，再运行代码
    shell> java -jar myapp.jar -Dagentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5505      # jdk 8
    shell> java -jar myapp.jar -Dagentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5505    # jdk 9+ 
    # Debug 模式：Listen to remote JVM : jvm 向指定主机的指定端口发送 dubug 信息，client 监听本地对应的端口，
    shell> java -jar myapp.jar -agentlib:jdwp=transport=dt_socket,server=n,address=Haku:5005,suspend=y,onthrow=<FQ exception class name>,onuncaught=<y/n>


# 查看 .class 文件的字节码信息
    shell> javap -v -p HelloWorld.class 

# 查看已经运行的 jvm 信息
    shell> jcmd pid VM.flags   
    shell> jinfo -flags pid  
    shell> jmap -heap pid



jdk 自带的文件编码转换工具 {
    shell> native2ascii -encoding GBK file1 file2 # 将 GBK 编码的 file1 转成 unicode 编码的 file2，如果省略 GBK 那么表示 file1 是操作系统默认的编码格式
    shell> native2ascii -reverse -encoding utf8 file1 file2 # 将 unicode 编码的文件（file1）转成 utf-8 编码的文件 （file2），如果省略 UTF8 那么转成操作系统默认的编码格式
}


手工批量编译 {
    Linux {
        shell> find -name "*.java" > sources.txt
        shell> javac -d ./out @sources.txt
    }
    
    Windows {
        shell> dir /s /B *.java > sources.txt
        shell> javac -d .\out @sources.txt
    }
}






