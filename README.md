# 分布式配置管理

统一管理各项目的配置文件，避免到各个服务器各个项目中分别修改配置文件，减少出错的可能，减轻运维的工作量。

## Installation

1. 你需要有ruby环境。
2. git clone本项目到你的电脑上。
3. 修改配置config/database.yml，配置自己的数据库。
4. 复制config/secrets.yml.example为config/secrets.yml，并修改其中的各个secret（请不要使用默认的！）。
5. 执行bundle install
6. 执行rake db:migrate
7. 执行rake db:seed
8. 执行rails s，项目即可启动，打开浏览器访问<http://localhost:3000/>，使用默认用户admin/admin登录即可。

## 使用
首先，需要添加自己的用户，删除默认用户（重要）！

添加项目。

添加ENV。例如，在线服务器环境prod，测试服务器环境qa，单元/集成测试环境ci等等（注意：此ENV与Rails项目的RAILS_ENV不是同一个概念）。

添加配置。选择运行环境、填写配置文件名称和配置文件内容，保存即可。

下载配置。http get请求 <http://localhost:3000/download/:app_name/:env>，得到的数据为用aes-128-cbc算法，以secrets.yml中的encrypt_key和encrypt_iv进行加密的数据。

## Enjoy
Thx
 
## License
未完，待续... 
 