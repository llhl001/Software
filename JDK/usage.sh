jvm 启动参数：{
    shell> $JAVA_HOME/bin/java -XX:+PrintFlagsInitial >> AllBootParam.txt   # 查看所有 jvm 启动参数

    category {
        1. 标准参数（-），所有的JVM实现都必须实现这些参数的功能，而且向后兼容；
        2. 非标准参数（-X），默认jvm实现这些参数的功能，但是并不保证所有jvm实现都满足，且不保证向后兼容；
        3. 非Stable参数（-XX），此类参数各个jvm实现会有所不同，将来可能会随时取消，需要慎重使用；
    }
    
    frequently boot parameters {
        shell> java -classpath          # 告诉 jvm 运行时所有文件的加载路径，设置该参数后将使 CLASSPATH 环境变量失效，
                                        # 如果 CLASSPATH 和 -classpath 都不存在，jvm 默认使用当前目录(./)作为类搜索路径
                    -javaagent:/root/agent.jar  # 加载 java 变成语言代理
                    -xshowSettings      # 显示所有 jvm 设置
                    
    }
    
    
    
}

shell 运行 java 程序 {
    编写 java 代码 {
        在 /root/home/kasei/haku 目录下新建一个 HelloWorld.java 文件，输入一下内容并保存
        
        package kasei.haku
        
        public class HelloWorld {
          public static void main() { 
              System.out.println("Hello World!");   
          }
        }
    }
    
    Compile .java 文件 {
        shell> cd /root/home/kasei/haku
        shell> javac HelloWorld.java    # 会在当前目录产生一个 HelloWorld.class 文件
    }
    
    Excute {
        .class 文件 {
            shell> cd /root/home    # 解释：
                                    # java 命令会根据 CLASSPATH 环境变量 中的路径寻找 .class 文件， CLASSPATH=.:%JAVA_HOME%/lib
                                    # 如果 .class 文件的包路径为 package kasei.haku
                                    # 如果在 /root/home/kasei/haku 目录下执行 java kasei.haku.HelloWorld 命令
                                    # java 命令会从 /root/home/kasei/haku/kasei/haku 路径下找 HelloWorld.class 文件，那么就会找不到，报错
            shell> java kasei.haku.HelloWorld
        }
        
        .jar 文件 {
            shell> java -jar .\procyon-decompiler.jar %%a -o .\source # 运行一个 jar 包，后面的是该 jar 包运行传入的参数
        }        
    }
    
}



jdk 自带的文件编码转换工具 {
    shell> native2ascii -encoding GBK file1 file2 # 将 GBK 编码的 file1 转成 unicode 编码的 file2，如果省略 GBK 那么表示 file1 是操作系统默认的编码格式
    shell> native2ascii -reverse -encoding utf8 file1 file2 # 将 unicode 编码的文件（file1）转成 utf-8 编码的文件 （file2），如果省略 UTF8 那么转成操作系统默认的编码格式
}

jdk 查看 .class 文件的字节码 {
    shell> javap -v -p HelloWorld.class 
}

jdk 查看已经启动的 jvm 启动参数 {
    shell> jcmd pid VM.flags   
    shell> jinfo -flags pid  
    shell> jmap -heap pid
}






