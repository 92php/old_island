# Node.js+Koa2+MySQL打造前后端分离精品项目《旧岛》   


第1章 从0到1手把手教你用Node.js KOA2打造超好用的 Web框架   
    1-1 纯正商业级应用 Node.js Koa2开发微信小程序服务端-导学   
    1-2 异步、JavaScript特性与NodeJS    
    1-3 申请AppKey    
    1-4 旧岛小样业务分析    
第2章 【深入理解KOA】Koa2的那点事儿与异步编程模型     
	2-1 软件与环境   
	2-2 node一小步，前端一大步  
	    nodejs的能力与应用
		1.脱离浏览器运行js  
		2.nodejs stream 前端工程化基础   
		3.服务端api  
		4.作为中间件  
	2-3 KOA的精简特性与二次开发必要性分析       
	2-4 模块加载、ES、TS、Babel浅谈       
	2-5 KOA的中间件     
	2-6 洋葱模型       
	2-7 强制Promise     
	2-8 深入理解async和awai    
	2-9 为什么一定要保证洋葱模型    
第3章 【让KOA更加好用】路由系统的改造    
	3-1 路由    
	3-2 服务端编程必备思维：主题与模型划分      
	3-3 多Router拆分       
	3-4 nodemon自动重启Server        
	3-5 vscode+nodemon调试     
	3-6 requireDirectory实现路由自动注册      
	3-7 初始化管理器与Process.cwd    
第4章 【深入浅出讲异常】异步异常与全局异常处理  
    4-1 参数获取与LinValidator   
	4-2 异常理论与异常  
	4-3 异步异常处理方法  
	4-4 全局异常处理中间件编写    
	4-5 已知错误与未知错   
	4-6 定义异常返回格式  
	4-7 定义HttpException异常基类   
	4-8 特定异常类与global全局变量  
第5章 LinValidator校验器与Sequelize Orm生成MySQL数据表  
	5-1 Lin-Validator使用指南  
	5-2 Lin-Validator获取HTTP参数    
	5-3 配置文件与在终端显示异常    
	5-4 关系型数据库与非关系型数据库     
	5-5 Navicat管理MySQL     
	5-6 Sequelize初始化配置与注意事项    
	5-7 User模型与用户唯一标识设计探讨   
	5-8 Sequelize个性化配置与数据维护策略   
	5-9 LinValidator综合应用     
第6章 【构建用户身份系统】通用用户系统与小程序用户系统   
	6-1 用户注册与Sequelize新增数据   
	6-2 中间件只在应用程序启动时初始化一次   
	6-3 盐与密码加密的小知识   
	6-4 模型的set操作    
	6-5 Success操作成功处理    
	6-6 isOptional校验    
	6-7 模拟枚举   
	6-8 验证用户账号密码    
第7章 【主流的用户身份识别方式与权限控制】JWT令牌与Auth权限控制中间件   
	7-1 jsonwebtoken    
	7-2 HttpBasicAuth传递令牌    
	7-3 验证JWT令牌   
	7-4 API权限分级控制    
	7-5 小程序openid登录系统    
	7-6 微信鉴权、openid与unionid     
	7-7 根据openid创建微信用户    
第8章 使用Lin-UI与在小程序中使用npm  
	8-1 Lin-UI组件库安装    
	8-2 在小程序中登录   
	8-3 Token Verify接口   
	8-4 数据库设计的好思路（实体表与业务表）    
	8-5 Music、Sentence、Movie模型定义   
	8-6 Flow模型与导入SQL数据_    
	8-7 在小程序中携带令牌   
	8-8 Sequelize模型的序列化   
第9章 点赞业务的实现    
	9-1 点赞业务逻辑分析与模型设计      
	9-2 数据库事务的基本概念   
	9-3 点赞业务逻辑实现   
	9-4 LinValidator的alias别名   
第10章 面向对象与MySQL in 查询    
	10-1 获取期刊点赞信息    
	10-2 修复上小节Type的问题   
	10-3 避免循环查询数据库   
	10-4 in查询避免循环查询数据库   
	10-5 面向对象设计谈：静态与实例   
	10-6 小心循环导入  
第11章 MySQL group分组查询与JS并发原理   
	11-1 热门书籍数据表设计   
	11-2 并发、并行，单线程的JS为什么可以高并发    
	11-3 MySQL group分组查询    
	11-4 获取热门图书列表    
	11-5 从鱼书服务获取图书详情数据   
	11-6 浅谈中间层和微服务   
第12章 KOA、Sequelize多层级JSON序列化     
	12-1 图书搜索   	 
	12-2 书籍点赞情况和我喜欢数据的数量接口实现   
	12-3 新增短评和短评+1接口实现   
	12-4 获取短评接口实现  
	12-5 JavaScript中的JSON序列化控制   
	12-6 全局控制Model模型JSON序列化行为（上）   
	12-7 全局控制Model模型JSON序列化行为（下）   
	12-8 Model上不要定义构造函数，否则会出错   
第13章 【无感知刷新、获取令牌、登陆等】前后端对接    
	13-1 小程序如何实现无感知刷新令牌   
	13-2 坑！坑！坑！Model中禁止使用构造函数   
	13-3 短评修复   
	13-4 KOA静态资源   
	13-5 image完整路径方案探讨   
	13-6 静态资源存储方案探讨   
	13-7 access_token和refresh_token双令牌保证无感知登录    
第14章 项目部署指南   
	14-1 部署指南与小程序云开发探讨   
	14-2 守护进程与PM2   
第15章 关于Lin CMS和现代大型Web架构思想
	15-1 基于前后端分离架构的Lin-CMS   
	15-2 Lin UI使用注意事项   
	15-3 Lin CMS的两种建立API模式   
	15-4 Lin CMS三种粒度的组件化支持：插件、业务组件与基础组件   
	15-5 Lin CMS权限与结束语    
	15-6 现代大型Web架构讲解    			


	

	




   














