# RailsChat 

RailsChat是一款由Rails开发的实时Web聊天室，在[Render_sync](https://github.com/chrismccord/render_sync 

)的基础上完成，有需要即时通讯的应用可以考虑这个Example

点击https://railschat1-wk894278076.c9users.io/ 



已经注册的用户可以直接进行登录，未注册的的用户可以点击注册按钮进行注册。

Note：请用两个浏览器分别登陆不同的用户来测试消息的即使推送，注意这两个用户需要互为好友

## 目前功能
* 登录，注册
* 用户管理自己的信息
* 管理员管理用户的信息
* 聊天室消息即时推送
* 支持查找，添加，删除好友
* 创建私人聊天，也支持多人聊天
* 房主可以拉人，踢人
* 房主能转移房屋权限
## 完成的功能
* 登录，注册
注册用户时对字段加以控制：
（1）保证邮箱字段的唯一性，每个邮箱仅可以注册一次。并且邮箱字段需要	按固定格式填写。          （2）控制用户名，邮箱，密码字段不能为空。并且密码应大于六位，用户名和邮箱的 	长度控制。
         （3）添加密码验证，两次输入密码输入应该一致。

* 用户管理自己的信息
  点击自己的用户名按钮就可以进入个人信息展示界面，点击edit可以进行编辑。编辑同样有登录功能相同的字段控制。
* 管理员管理用户的信息
  管理员账号：manager 密码：manager@test.com
  管理员用户登录后header会出现Manage按钮，点击后进入管理界面，可以对现有用户进行管理。


## Todo
1. 现在的即时推送只限于聊天的消息，其他的推送比如未读信息提醒（包括声音）等还未涉及
2. 添加好友需要对方同意，现在是单方面添加


1. Fork项目

  ```
  git clone https://github.com/Wilkersoon/RailsChat 

  cd RailsChat
  bundle install
  rails server
  ```

2. 然后再打开另外一个终端，运行以下命令启动另外一个server来监听聊天室的用户并实时推送最新的消息：

  ```
  rackup sync.ru 

 -E production
  ```


## Debug

1. 当遇到消息并没有实时推送的情况时，先F12查看浏览器的Js文件加载情况，若faye.js加载成功则一般不会出现问题

2. 以上加载完成但是仍然没有推送的时候，请查看Rails服务器的log文件

3. 需要在两个浏览器中登录不同的账号来检验聊天室功能


## 截图

<img src="b/Snip20170301_2.png">

<img src="b/Snip20170301_3.png">

<img src="b/Snip20170301_4.png">

<img src="b/Snip20170301_5.png">


