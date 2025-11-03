---
title: 知识共享平台
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - ruby: Ruby
  - python: Python
  - php: PHP
  - java: Java
  - go: Go
toc_footers: []
includes: []
search: true
code_clipboard: true
highlight_theme: darkula
headingLevel: 2
generator: "@tarslib/widdershins v4.0.23"

---

# 知识共享平台

Base URLs:

# Authentication

# 管理端/管理端用户管理接口

<a id="opIdupdatePermissionLevel"></a>

## PUT 调整用户权限

PUT /api/admin/management/usermg/{id}/permission-level

根据用户ID调整用户的权限等级

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|permissionLevel|query|integer(int32)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdupdateFrozenStatus"></a>

## PUT 修改用户冻结状态

PUT /api/admin/management/usermg/{id}/frozen-status

根据用户ID修改用户的冻结状态

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|isFrozen|query|integer(int32)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdupdateUser"></a>

## PUT 更新用户

PUT /api/admin/management/usermg/update

根据用户信息更新用户

> Body 请求参数

```json
0
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|integer(int64)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdcreateUser"></a>

## POST 创建用户

POST /api/admin/management/usermg/create

根据用户信息创建新用户

> Body 请求参数

```json
{
  "username": "string",
  "password": "string",
  "email": "string",
  "phoneNumber": "string",
  "isAdmin": 1,
  "isFrozen": 1,
  "permissionLevel": 2,
  "gender": 2,
  "birthDate": "2019-08-24",
  "bio": "string",
  "avatar": "string",
  "reviewStatus": 2
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[UserCreateDTO](#schemausercreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdgetSortedUsers"></a>

## GET 分页获取用户信息，排序字段，模糊查询

GET /api/admin/management/usermg/getSortedPage

根据分页参数获取用户信息

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|pageNum|query|integer(int32)| 是 |none|
|pageSize|query|integer(int32)| 是 |none|
|orderByColumn|query|string| 否 |none|
|sort|query|string| 否 |none|
|username|query|string| 否 |none|
|email|query|string| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageUser](#schemaresppageuser)|

<a id="opIdgetUserByUsername"></a>

## GET 根据用户名获取用户信息

GET /api/admin/management/usermg/getByUsername/{username}

根据用户名获取用户信息

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|username|path|string| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespUser](#schemarespuser)|

<a id="opIdgetAllUsers"></a>

## GET 获取所有用户信息

GET /api/admin/management/usermg/getAll

获取所有用户信息

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|page|query|integer(int32)| 否 |none|
|size|query|integer(int32)| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageUser](#schemaresppageuser)|

<a id="opIdgetUserById_1"></a>

## GET 获取用户信息

GET /api/admin/management/usermg/get/{id}

根据用户ID获取用户信息

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespUser](#schemarespuser)|

<a id="opIddeleteUser"></a>

## DELETE 删除用户

DELETE /api/admin/management/usermg/delete/{id}

根据用户ID删除用户

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

# 管理端/管理端帖子管理接口

<a id="opIdupdatePost_2"></a>

## PUT 更新帖子

PUT /api/admin/management/post/update/{postId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdgetTagsBySectionId_1"></a>

## GET 获取分区下的所有标签

GET /api/admin/management/post/{sectionId}/tags

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|sectionId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListTag](#schemaresplisttag)|

<a id="opIdgetPostsBySectionOrTag_1"></a>

## GET 获取分区或标签下的所有帖子

GET /api/admin/management/post/{sectionId}/posts

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|sectionId|path|integer(int64)| 是 |none|
|tagId|query|integer(int64)| 否 |none|
|current|query|integer(int64)| 否 |none|
|size|query|integer(int64)| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPagePost](#schemaresppagepost)|

<a id="opIdsearchPostsBySection_1"></a>

## GET 按分区和关键字搜索帖子

GET /api/admin/management/post/{sectionId}/posts/search

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|sectionId|path|integer(int64)| 是 |none|
|keyword|query|string| 否 |none|
|current|query|integer(int64)| 否 |none|
|size|query|integer(int64)| 否 |none|
|sortBy|query|string| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPagePost](#schemaresppagepost)|

<a id="opIdgetPostById"></a>

## GET 根据ID获取帖子

GET /api/admin/management/post/{postId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPost](#schemaresppost)|

<a id="opIddeletePost_2"></a>

## DELETE 删除帖子

DELETE /api/admin/management/post/{postId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdgetCollectionById"></a>

## GET 根据ID获取收藏夹

GET /api/admin/management/post/collection/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCollection](#schemarespcollection)|

<a id="opIdgetAllSections_2"></a>

## GET 获取所有分区

GET /api/admin/management/post/all

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

# 管理端/管理端反馈管理接口

<a id="opIdupdateStatus_1"></a>

## PUT 更新反馈状态

PUT /api/admin/management/feedback/updateStatus

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|query|integer(int64)| 是 |none|
|status|query|integer(int32)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetUserFeedbacks_1"></a>

## GET 获取用户的反馈列表

GET /api/admin/management/feedback/userFeedbacks

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |none|
|status|query|integer(int32)| 否 |none|
|current|query|integer(int64)| 否 |none|
|size|query|integer(int64)| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdqueryFeedbacks"></a>

## GET 按条件分页查询反馈记录

GET /api/admin/management/feedback/query

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 否 |none|
|feedbackContent|query|string| 否 |none|
|status|query|integer(int32)| 否 |none|
|startTime|query|string| 否 |none|
|endTime|query|string| 否 |none|
|page|query|integer(int32)| 否 |none|
|size|query|integer(int32)| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetAllFeedbacks"></a>

## GET 获取所有反馈列表

GET /api/admin/management/feedback/allFeedbacks

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|status|query|integer(int32)| 否 |none|
|current|query|integer(int64)| 否 |none|
|size|query|integer(int64)| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIddeleteFeedback_1"></a>

## DELETE 删除反馈

DELETE /api/admin/management/feedback/delete

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|query|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

# 管理端/管理端评论管理

<a id="opIdupdateCommentStatus"></a>

## PUT 更新评论状态

PUT /api/admin/management/comment/{id}/status/{status}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |评论ID|
|status|path|integer(int32)| 是 |状态(0:不可见 1:可见)|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdgetCommentDetail_1"></a>

## GET 获取评论详情

GET /api/admin/management/comment/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespAdminCommentDTO](#schemarespadmincommentdto)|

<a id="opIddeleteComment_4"></a>

## DELETE 删除评论

DELETE /api/admin/management/comment/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdgetCommentList"></a>

## GET 获取评论列表

GET /api/admin/management/comment/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |当前页|
|size|query|integer(int64)| 否 |每页大小|
|keyword|query|string| 否 |评论内容关键词|
|commentableType|query|integer(int32)| 否 |评论类型(1:帖子 2:合集 3:评论)|
|startTime|query|string| 否 |开始时间|
|endTime|query|string| 否 |结束时间|
|status|query|integer(int32)| 否 |评论状态(0:不可见 1:可见)|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageAdminCommentDTO](#schemaresppageadmincommentdto)|

# 管理端/合集管理接口

<a id="opIdupdateCollection_2"></a>

## PUT 更新合集

PUT /admin/collection

> Body 请求参数

```json
{
  "id": 0,
  "collectionName": "string",
  "collectionDescription": "string",
  "visibility": 0,
  "reviewStatus": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[CollectionUpdateDTO](#schemacollectionupdatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCollection](#schemarespcollection)|

<a id="opIdcreateCollection_2"></a>

## POST 创建合集

POST /admin/collection

> Body 请求参数

```json
{
  "collectionName": "string",
  "collectionDescription": "string",
  "creatorId": 0,
  "visibility": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[CollectionCreateDTO](#schemacollectioncreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCollection](#schemarespcollection)|

<a id="opIdgetCollection_1"></a>

## GET 获取合集详情

GET /admin/collection/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCollection](#schemarespcollection)|

<a id="opIddeleteCollection_2"></a>

## DELETE 删除合集

DELETE /admin/collection/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

<a id="opIdqueryCollections_1"></a>

## GET 分页查询合集

GET /admin/collection/page

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|collectionName|query|string| 否 |合集名称|
|creatorId|query|integer(int64)| 否 |创建者ID|
|visibility|query|integer(int32)| 否 |可见性|
|reviewStatus|query|integer(int32)| 否 |审核状态|
|startTime|query|string(date-time)| 否 |开始时间|
|endTime|query|string(date-time)| 否 |结束时间|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageCollection](#schemaresppagecollection)|

<a id="opIdisSubscribed"></a>

## GET 判断用户是否订阅了合集

GET /admin/collection/isSubscribed

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|collectionId|query|integer(int64)| 是 |none|
|userId|query|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetUserCollectionCount"></a>

## GET 获取用户创建的合集总数

GET /admin/collection/count/{userId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespInteger](#schemarespinteger)|

# 管理端/管理端统计相关接口

<a id="opIdgetStatistics"></a>

## POST 获取统计数据

POST /api/admin/statistics

> Body 请求参数

```json
{
  "field": "string",
  "timeScale": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[StatisticsRequest](#schemastatisticsrequest)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespStatisticsResponse](#schemarespstatisticsresponse)|

# 管理端/管理端审核管理接口

<a id="opIdhandleReview"></a>

## POST 处理审核

POST /api/admin/management/review/handle

> Body 请求参数

```json
{
  "id": 0,
  "targetId": 0,
  "type": 1,
  "status": 2,
  "reason": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[ReviewManageDTO](#schemareviewmanagedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

<a id="opIdgetReviewDetail"></a>

## GET 获取审核详情

GET /api/admin/management/review/{reviewId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|reviewId|path|integer(int64)| 是 |审核ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespReviewManageVO](#schemarespreviewmanagevo)|

<a id="opIdgetReviewList"></a>

## GET 获取审核列表

GET /api/admin/management/review/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|type|query|integer(int32)| 否 |none|
|status|query|integer(int32)| 否 |none|
|page|query|integer(int32)| 否 |none|
|size|query|integer(int32)| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageReviewManageVO](#schemaresppagereviewmanagevo)|

# 管理端/管理端举报管理接口

<a id="opIdhandleReport"></a>

## POST 处理举报

POST /api/admin/management/report/handle

> Body 请求参数

```json
{
  "reportId": 0,
  "status": 0,
  "outcome": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[ReportHandleDTO](#schemareporthandledto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdgetReportDetail"></a>

## GET 获取举报详情

GET /api/admin/management/report/{reportId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|reportId|path|integer(int64)| 是 |举报ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespReportVO](#schemarespreportvo)|

<a id="opIdgetReportStats"></a>

## GET 获取举报统计信息

GET /api/admin/management/report/stats

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringObject](#schemarespmapstringobject)|

<a id="opIdgetReportList"></a>

## GET 获取举报列表

GET /api/admin/management/report/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|userId|query|integer(int64)| 否 |举报用户ID|
|reportedTypeId|query|integer(int64)| 否 |举报对象类型ID|
|reportTypeId|query|integer(int64)| 否 |举报类型ID|
|status|query|integer(int32)| 否 |处理状态|
|startTime|query|string(date-time)| 否 |开始时间|
|endTime|query|string(date-time)| 否 |结束时间|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageReportVO](#schemaresppagereportvo)|

# 管理端/管理员登录接口

<a id="opIdlogin_2"></a>

## POST 管理员登录

POST /api/admin/login

> Body 请求参数

```json
{
  "username": "string",
  "password": "string",
  "lastLoginTime": "2019-08-24T14:15:22Z",
  "lastLoginLocation": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[AdminLoginDTO](#schemaadminlogindto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringObject](#schemarespmapstringobject)|

<a id="opIdrefreshToken_1"></a>

## POST 刷新Token

POST /api/admin/login/refresh-token

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringString](#schemarespmapstringstring)|

<a id="opIdlogout_1"></a>

## POST 管理员退出登录

POST /api/admin/login/logout

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

<a id="opIdgetIpInfo_1"></a>

## GET 获取IP地址信息

GET /api/admin/login/ip-info

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|ip|query|string| 否 |IP地址，为空则获取当前请求的IP|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringString](#schemarespmapstringstring)|

<a id="opIdgetLoginInfo_1"></a>

## GET 获取当前登录管理员信息

GET /api/admin/login/info

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringObject](#schemarespmapstringobject)|

<a id="opIdcheckToken_1"></a>

## GET 检查Token有效性

GET /api/admin/login/check-token

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|query|string| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

# 用户端/客户端个人中心个人帖子管理

<a id="opIdupdatePost_1"></a>

## PUT 更新帖子

PUT /api/client/personal/post

> Body 请求参数

```json
{
  "title": "string",
  "cover": "string",
  "summary": "string",
  "contentFileId": "string",
  "contentFilePath": "string",
  "sectionId": 0,
  "tags": "string",
  "collectionId": 0,
  "hasCitation": 0,
  "visibility": 0,
  "citation": {
    "citationTypeId": 0,
    "citationContent": "string",
    "source": "string"
  }
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|query|integer(int64)| 是 |none|
|token|header|string| 否 |none|
|body|body|[PostPublishDTO](#schemapostpublishdto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPost](#schemaresppost)|

<a id="opIdgetPostDetail_1"></a>

## GET 获取帖子详情

GET /api/client/personal/post/{postId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |none|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespObject](#schemarespobject)|

<a id="opIddeletePost_1"></a>

## DELETE 删除帖子

DELETE /api/client/personal/post/{postId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetMyPosts"></a>

## GET 获取我的帖子列表

GET /api/client/personal/post/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |当前页|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPagePost](#schemaresppagepost)|

# 用户端/客户端历史接口

<a id="opIdmoveFavorite_1"></a>

## PUT 移动收藏到其他收藏夹

PUT /api/client/personal/history/favorite/move/{id}/folder/{newFolderId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|newFolderId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdbatchMoveFavorites_1"></a>

## PUT 批量移动收藏

PUT /api/client/personal/history/favorite/batch/move

> Body 请求参数

```json
[
  0
]
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|newFolderId|query|integer(int64)| 是 |none|
|token|header|string| 否 |none|
|body|body|array[integer]| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdaddFavorite_1"></a>

## POST 添加收藏

POST /api/client/personal/history/favorite/user/{userId}/post/{postId}/folder/{folderId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|postId|path|integer(int64)| 是 |none|
|folderId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetLikeCount"></a>

## GET 获取用户点赞总数

GET /api/client/personal/history/user/{userId}/likeCount

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespInteger](#schemarespinteger)|

<a id="opIdgetUserShares"></a>

## GET 获取用户所有分享记录

GET /api/client/personal/history/share/user/{userId}/page/{current}/{size}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|current|path|integer(int64)| 是 |none|
|size|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageShare](#schemaresppageshare)|

<a id="opIdgetUserShareCount"></a>

## GET 获取用户分享的总数

GET /api/client/personal/history/share/user/{userId}/count

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespLong](#schemaresplong)|

<a id="opIdgetObjectShares"></a>

## GET 获取特定对象的分享记录

GET /api/client/personal/history/share/object/{objectId}/type/{objectType}/page/{current}/{size}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|objectId|path|integer(int64)| 是 |none|
|objectType|path|integer(int32)| 是 |none|
|current|path|integer(int64)| 是 |none|
|size|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageShare](#schemaresppageshare)|

<a id="opIdgetPostViews_1"></a>

## GET 获取特定帖子的浏览记录（分页）

GET /api/client/personal/history/postId/{postId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |none|
|current|query|integer(int64)| 否 |none|
|size|query|integer(int64)| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetPostViewCount_1"></a>

## GET 获取特定帖子的浏览次数

GET /api/client/personal/history/post/{postId}/count

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespLong](#schemaresplong)|

<a id="opIdgetLikesByType"></a>

## GET 获取用户对特定对象类型的点赞记录

GET /api/client/personal/history/like/user/{userId}/type/{objectType}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|objectType|path|integer(int32)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetAllLikes"></a>

## GET 获取用户所有点赞记录

GET /api/client/personal/history/like/user/all likes/{userId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetUserFavorites_1"></a>

## GET 获取用户的收藏列表

GET /api/client/personal/history/favorite/user/{userId}/folder/{folderId}/page/{current}/{size}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|folderId|path|integer(int64)| 是 |none|
|current|path|integer(int64)| 是 |none|
|size|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetCommentsByType"></a>

## GET 获取用户对特定类型对象的评论记录

GET /api/client/personal/history/comment/user/{userId}/type/{objectType}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|objectType|path|integer(int32)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListComment](#schemaresplistcomment)|

<a id="opIdgetCommentCount"></a>

## GET 获取用户评论总数

GET /api/client/personal/history/comment/user/{userId}/count

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespInteger](#schemarespinteger)|

<a id="opIdgetAllComments"></a>

## GET 获取用户所有评论记录

GET /api/client/personal/history/comment/user/all comments/{userId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListComment](#schemaresplistcomment)|

<a id="opIdgetUserViews_1"></a>

## GET 获取用户的浏览记录（分页）

GET /api/client/personal/history/allPost/{userId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|current|query|integer(int64)| 否 |none|
|size|query|integer(int64)| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIddeleteShare_1"></a>

## DELETE 删除用户的分享记录

DELETE /api/client/personal/history/share/user/{userId}/share/{shareId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|shareId|path|integer(int64)| 是 |none|
|userId|path|string| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

<a id="opIddeleteUserViews_1"></a>

## DELETE 删除用户的所有浏览记录

DELETE /api/client/personal/history/post/{userId}/delete

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIddeleteView_1"></a>

## DELETE 删除单条浏览记录

DELETE /api/client/personal/history/post/delete/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdcancelFavorite_1"></a>

## DELETE 取消收藏

DELETE /api/client/personal/history/favorite/user/{userId}/post/{postId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|postId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIddeleteComment_1"></a>

## DELETE 逻辑删除指定评论

DELETE /api/client/personal/history/comment/{commentId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|commentId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

<a id="opIdclearAllComments"></a>

## DELETE 清空用户所有评论记录

DELETE /api/client/personal/history/comment/user/{userId}/clear

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

# 用户端/客户端个人中心个人收藏管理

<a id="opIdupdateFolder_1"></a>

## PUT 修改收藏夹

PUT /api/client/personal/favorite/folder

> Body 请求参数

```json
{
  "folderName": "string",
  "visibility": 0,
  "id": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[FavoriteFolderDTO](#schemafavoritefolderdto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdcreateFolder_1"></a>

## POST 创建收藏夹

POST /api/client/personal/favorite/folder

> Body 请求参数

```json
{
  "folderName": "string",
  "visibility": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[FavoriteFolderCreateDTO](#schemafavoritefoldercreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdmoveFavorite_2"></a>

## POST 移动收藏

POST /api/client/personal/favorite/move/{favoriteId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|favoriteId|path|integer(int64)| 是 |none|
|targetFolderId|query|integer(int64)| 是 |目标收藏夹ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetFavoriteList"></a>

## GET 获取收藏列表

GET /api/client/personal/favorite/list/{folderId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|folderId|path|integer(int64)| 是 |none|
|current|query|integer(int64)| 否 |当前页|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetFolderList"></a>

## GET 获取收藏夹列表

GET /api/client/personal/favorite/folder/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |当前页|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIddeleteFavorite"></a>

## DELETE 删除收藏

DELETE /api/client/personal/favorite/{favoriteId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|favoriteId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIddeleteFolder_1"></a>

## DELETE 删除收藏夹

DELETE /api/client/personal/favorite/folder/{folderId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|folderId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

# 用户端/客户端个人中心个人合集管理

<a id="opIdupdateCollection_1"></a>

## PUT 更新合集

PUT /api/client/personal/collection

> Body 请求参数

```json
{
  "id": 0,
  "collectionName": "string",
  "collectionDescription": "string",
  "visibility": 0,
  "reviewStatus": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[CollectionUpdateDTO](#schemacollectionupdatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCollection](#schemarespcollection)|

<a id="opIdcreateCollection"></a>

## PUT 增加合集

PUT /api/client/personal/collection/add

> Body 请求参数

```json
{
  "collectionName": "string",
  "collectionDescription": "string",
  "visibility": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[CreateCollectionDTO](#schemacreatecollectiondto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCollection](#schemarespcollection)|

<a id="opIdgetCollectionDetail"></a>

## GET 获取合集详情

GET /api/client/personal/collection/{collectionId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|collectionId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCollection](#schemarespcollection)|

<a id="opIddeleteCollection_1"></a>

## DELETE 删除合集

DELETE /api/client/personal/collection/{collectionId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|collectionId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetSubscribedCollections"></a>

## GET 获取我订阅的合集列表

GET /api/client/personal/collection/subscribed

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |当前页|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageCollection](#schemaresppagecollection)|

<a id="opIdgetMyCollections"></a>

## GET 获取我创建的合集列表

GET /api/client/personal/collection/created

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |当前页|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageCollection](#schemaresppagecollection)|

<a id="opIdunsubscribeCollection"></a>

## DELETE 取消订阅合集

DELETE /api/client/personal/collection/subscription/{collectionId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|collectionId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

# 用户端/客户端个人中心接口

<a id="opIdgetUserInfo"></a>

## GET 获取用户信息

GET /api/client/personal/center/info

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespUserInfoVO](#schemarespuserinfovo)|

<a id="opIdupdateUserInfo"></a>

## PUT 更新用户信息

PUT /api/client/personal/center/info

> Body 请求参数

```json
{
  "username": "string",
  "email": "string",
  "phoneNumber": "string",
  "gender": 0,
  "birthDate": "2019-08-24",
  "bio": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[UpdateUserInfoDTO](#schemaupdateuserinfodto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespUserInfoVO](#schemarespuserinfovo)|

<a id="opIddeactivateAccount"></a>

## POST 注销账号

POST /api/client/personal/center/deactivate

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|password|query|string| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIduploadAvatar"></a>

## POST 上传用户头像

POST /api/client/personal/center/avatar

> Body 请求参数

```json
{
  "file": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|object| 否 |none|
|» file|body|string(binary)| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

# 用户端/客户端通知接口

<a id="opIdmarkAsRead_1"></a>

## PUT 标记指定通知为已读

PUT /api/client/notification/{id}/read

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdmarkAllAsRead_1"></a>

## PUT 标记用户所有通知为已读

PUT /api/client/notification/user/{userId}/markAllRead

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetNotificationDetails"></a>

## GET 查看单条通知的详情

GET /api/client/notification/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIddeleteNotification_1"></a>

## DELETE 删除指定通知

DELETE /api/client/notification/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetUnreadCount_1"></a>

## GET 获取用户未读通知的数量

GET /api/client/notification/user/{userId}/unreadCount

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespLong](#schemaresplong)|

<a id="opIdgetAllNotifications"></a>

## GET 获取用户的所有通知

GET /api/client/notification/user/{userId}/all

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|type|query|integer(int32)| 否 |none|
|current|query|integer(int64)| 否 |none|
|size|query|integer(int64)| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

# 用户端/客户端帖子发布

<a id="opIdsavePost"></a>

## POST 保存帖子

POST /api/client/post/publish/save

> Body 请求参数

```json
{
  "title": "string",
  "cover": "string",
  "summary": "string",
  "contentFileId": "string",
  "contentFilePath": "string",
  "sectionId": 0,
  "tags": "string",
  "collectionId": 0,
  "hasCitation": 0,
  "visibility": 0,
  "citation": {
    "citationTypeId": 0,
    "citationContent": "string",
    "source": "string"
  }
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[PostPublishDTO](#schemapostpublishdto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespLong](#schemaresplong)|

<a id="opIdpublishPost"></a>

## POST 发布帖子

POST /api/client/post/publish/publish

> Body 请求参数

```json
{
  "title": "string",
  "cover": "string",
  "summary": "string",
  "contentFileId": "string",
  "contentFilePath": "string",
  "sectionId": 0,
  "tags": "string",
  "collectionId": 0,
  "hasCitation": 0,
  "visibility": 0,
  "citation": {
    "citationTypeId": 0,
    "citationContent": "string",
    "source": "string"
  }
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[PostPublishDTO](#schemapostpublishdto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespLong](#schemaresplong)|

<a id="opIdgetAllSections_1"></a>

## GET 获取所有分区

GET /api/client/post/publish/sections

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetTagsBySection_1"></a>

## GET 获取分区下的标签

GET /api/client/post/publish/sections/{sectionId}/tags

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|sectionId|path|integer(int64)| 是 |分区ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespObject](#schemarespobject)|

<a id="opIdgetUserCollections"></a>

## GET 获取用户的合集列表

GET /api/client/post/publish/collections

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespObject](#schemarespobject)|

<a id="opIdgetAllCitationTypes"></a>

## GET 获取所有引用类型

GET /api/client/post/publish/citation-types

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListCitationType](#schemaresplistcitationtype)|

# 用户端/客户端帖子详情接口

<a id="opIdviewPost"></a>

## POST 浏览帖子

POST /api/client/post-detail/{postId}/view

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |帖子ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdsharePost"></a>

## POST 分享帖子

POST /api/client/post-detail/{postId}/share

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |帖子ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdreportPost"></a>

## POST 举报帖子

POST /api/client/post-detail/{postId}/report

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |帖子ID|
|reportTypeId|query|integer(int64)| 是 |举报类型ID|
|reason|query|string| 否 |举报理由|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespReport](#schemarespreport)|

<a id="opIdreplyPost"></a>

## POST 回复帖子

POST /api/client/post-detail/{postId}/reply

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |帖子ID|
|content|query|string| 是 |评论内容|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCommentDTO](#schemarespcommentdto)|

<a id="opIdtogglePostLike"></a>

## POST 点赞/取消点赞帖子

POST /api/client/post-detail/{postId}/like

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |帖子ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdtogglePostFavorite"></a>

## POST 收藏/取消收藏帖子

POST /api/client/post-detail/{postId}/favorite

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |帖子ID|
|folderId|query|integer(int64)| 是 |收藏夹ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdtoggleCommentLike"></a>

## POST 点赞/取消点赞评论

POST /api/client/post-detail/comments/{commentId}/like

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|commentId|path|integer(int64)| 是 |评论ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdgetPostDetail"></a>

## GET 获取帖子详细信息

GET /api/client/post-detail/{postId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |帖子ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespObject](#schemarespobject)|

<a id="opIdgetPostStats"></a>

## GET 获取帖子统计信息

GET /api/client/post-detail/{postId}/stats

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |帖子ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPostStatsDTO](#schemaresppoststatsdto)|

<a id="opIdgetPostComments"></a>

## GET 获取帖子评论列表

GET /api/client/post-detail/{postId}/comments

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |帖子ID|
|current|query|integer(int64)| 否 |当前页码|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageCommentDTO](#schemaresppagecommentdto)|

<a id="opIdgetAllReportedTypes"></a>

## GET 获取所有举报对象类型

GET /api/client/post-detail/reported-types

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListReportedType](#schemaresplistreportedtype)|

<a id="opIdgetAllReportTypes"></a>

## GET 获取所有举报类型

GET /api/client/post-detail/report-types

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListReportType](#schemaresplistreporttype)|

<a id="opIdgetChildComments"></a>

## GET 获取评论的子评论

GET /api/client/post-detail/comments/{commentId}/children

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|commentId|path|integer(int64)| 是 |评论ID|
|current|query|integer(int64)| 否 |当前页码|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageCommentDTO](#schemaresppagecommentdto)|

# 用户端/客户端个人主页接口

<a id="opIdreportUser"></a>

## POST 举报用户

POST /api/client/personal/profile/{userId}/report

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |被举报用户ID|
|reportTypeId|query|integer(int64)| 是 |举报类型ID|
|reason|query|string| 否 |举报理由|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespReport](#schemarespreport)|

<a id="opIdgetFollowing"></a>

## GET 获取用户的关注详情列表

GET /api/client/personal/profile/{userId}/following

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListUserFollowDetailVO](#schemaresplistuserfollowdetailvo)|

<a id="opIdgetFollowers"></a>

## GET 获取用户的粉丝详情列表

GET /api/client/personal/profile/{userId}/followers

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListUserFollowDetailVO](#schemaresplistuserfollowdetailvo)|

<a id="opIdgetFollowStats"></a>

## GET 获取用户的关注者和被关注者统计

GET /api/client/personal/profile/{userId}/follow-stats

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringInteger](#schemarespmapstringinteger)|

<a id="opIdgetFollowDetails"></a>

## GET 一次性获取用户的关注者、被关注者详情以及统计信息

GET /api/client/personal/profile/{userId}/follow-details

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListMapStringObject](#schemaresplistmapstringobject)|

# 用户端/客户端登录接口

<a id="opIdlogin_1"></a>

## POST 登录

POST /api/client/login

> Body 请求参数

```json
{
  "username": "string",
  "phoneNumber": "string",
  "password": "string",
  "captcha": "string",
  "loginType": 0,
  "lastLoginTime": "2019-08-24T14:15:22Z",
  "lastLoginLocation": "string",
  "checkConfig": {
    "checkDeleted": 0,
    "checkFrozen": 0,
    "checkAdmin": 0,
    "checkReview": 0
  }
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[ClientLoginDTO](#schemaclientlogindto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringObject](#schemarespmapstringobject)|

<a id="opIdregister_1"></a>

## POST 注册

POST /api/client/login/register

> Body 请求参数

```json
{
  "username": "string",
  "password": "string",
  "phoneNumber": "string",
  "captcha": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[ClientRegisterDTO](#schemaclientregisterdto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdrefreshToken"></a>

## POST 刷新Token

POST /api/client/login/refresh

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringString](#schemarespmapstringstring)|

<a id="opIdlogout"></a>

## POST 退出登录

POST /api/client/login/logout

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

<a id="opIdforgetPassword"></a>

## POST 忘记密码

POST /api/client/login/forget-password

> Body 请求参数

```json
{
  "phoneNumber": "string",
  "newPassword": "string",
  "captcha": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[ForgetPasswordDTO](#schemaforgetpassworddto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIddeactivateAccount_1"></a>

## POST 账号注销

POST /api/client/login/deactivate

> Body 请求参数

```json
{
  "password": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[DeactivateAccountDTO](#schemadeactivateaccountdto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdchangePassword"></a>

## POST 修改密码

POST /api/client/login/change-password

> Body 请求参数

```json
{
  "oldPassword": "string",
  "newPassword": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[ChangePasswordDTO](#schemachangepassworddto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdsendCaptcha"></a>

## POST 发送验证码

POST /api/client/login/captcha

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|phoneNumber|query|string| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdgetIpInfo"></a>

## GET 获取IP地址信息

GET /api/client/login/ip

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|ip|query|string| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringString](#schemarespmapstringstring)|

<a id="opIdgetLoginInfo"></a>

## GET 获取当前登录用户信息

GET /api/client/login/info

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringObject](#schemarespmapstringobject)|

<a id="opIdcheckToken"></a>

## GET 检查Token有效性

GET /api/client/login/check

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|query|string| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

# 用户端/客户端反馈接口

<a id="opIdsubmitFeedback"></a>

## POST 提交反馈

POST /api/client/feedback/submit

> Body 请求参数

```json
{
  "feedbackContent": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[FeedbackDTO](#schemafeedbackdto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetUserFeedbacks"></a>

## GET 获取用户反馈列表

GET /api/client/feedback/user/{userId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |用户ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIddeleteFeedback"></a>

## DELETE 删除反馈

DELETE /api/client/feedback/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |反馈ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

# 用户端/客户端评论接口

<a id="opIdreportComment"></a>

## POST 举报评论

POST /api/client/comment/{commentId}/report

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|commentId|path|integer(int64)| 是 |评论ID|
|reportTypeId|query|integer(int64)| 是 |举报类型ID|
|reason|query|string| 否 |举报理由|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdreplyComment"></a>

## POST 回复评论

POST /api/client/comment/{commentId}/reply

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|commentId|path|integer(int64)| 是 |评论ID|
|content|query|string| 是 |评论内容|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCommentDTO](#schemarespcommentdto)|

<a id="opIddeleteComment_3"></a>

## DELETE 删除评论

DELETE /api/client/comment/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |评论ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

# 用户端/客户端合集相关接口

<a id="opIdsubscribeCollection"></a>

## POST 订阅合集

POST /api/client/collections/{id}/subscribe

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdshareCollection"></a>

## POST 分享合集

POST /api/client/collections/{id}/share

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdlikeCollection"></a>

## POST 点赞合集

POST /api/client/collections/{id}/like

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdcommentCollection"></a>

## POST 评论合集

POST /api/client/collections/{id}/comment

> Body 请求参数

```json
{
  "content": "string",
  "parentId": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|
|body|body|[CommentRequest](#schemacommentrequest)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespObject](#schemarespobject)|

<a id="opIdgetCollectionDetail_1"></a>

## GET 查看合集详情

GET /api/client/collections/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespObject](#schemarespobject)|

<a id="opIdgetAllCollections"></a>

## GET 获取所有合集

GET /api/client/collections/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespObject](#schemarespobject)|

# 用户端/客户端AI对话接口

<a id="opIdchat"></a>

## POST 发送对话消息(流式)

POST /api/client/ai/chat/{clientId}

发送消息前需要先调用 /connect 接口获取 clientId

> Body 请求参数

```json
"string"
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|clientId|path|string| 是 |客户端ID(通过 /connect 接口获取)|
|token|header|string| 否 |none|
|body|body|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

<a id="opIdclose"></a>

## DELETE 关闭对话连接

DELETE /api/client/ai/chat/{clientId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|clientId|path|string| 是 |客户端ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

<a id="opIdgetAiWritingAssistance"></a>

## POST AI帮写文章

POST /api/client/ai/chat/write

根据提供的信息自动补全文章内容

> Body 请求参数

```json
{
  "title": "string",
  "description": "string",
  "existingContent": "string",
  "outputFormat": "string",
  "writingStyle": "string",
  "targetWordCount": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[AiWritingRequest](#schemaaiwritingrequest)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdchatSync"></a>

## POST 发送对话消息(非流式)

POST /api/client/ai/chat/sync/{clientId}

直接发送消息并等待完整回复

> Body 请求参数

```json
"string"
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|clientId|path|string| 是 |客户端ID(通过 /connect 接口获取)|
|token|header|string| 否 |none|
|body|body|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdgetUserActivitySummary"></a>

## GET 获取用户近期活动总结

GET /api/client/ai/chat/summary

根据用户的发帖和浏览历史生成总结

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |用户token|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdconnect"></a>

## GET 建立对话连接

GET /api/client/ai/chat/connect

在发送消息前必须先调用此接口建立连接

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[SseEmitter](#schemasseemitter)|

# 用户端/客户端个人统计接口

<a id="opIdgetSocialStats"></a>

## GET 获取用户社交统计数据

GET /api/client/statistics/{userId}/social

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringInteger](#schemarespmapstringinteger)|

<a id="opIdgetInteractionStats"></a>

## GET 获取用户互动统计数据

GET /api/client/statistics/{userId}/interaction

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringInteger](#schemarespmapstringinteger)|

<a id="opIdgetContentStats"></a>

## GET 获取用户内容创作统计数据

GET /api/client/statistics/{userId}/content

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringInteger](#schemarespmapstringinteger)|

<a id="opIdgetAllStats"></a>

## GET 获取用户所有统计数据

GET /api/client/statistics/{userId}/all

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespMapStringInteger](#schemarespmapstringinteger)|

# 用户端/客户端分区接口

<a id="opIdgetTagsBySectionId"></a>

## GET 获取分区下的所有标签

GET /api/client/section/{sectionId}/tags

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|sectionId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListTag](#schemaresplisttag)|

<a id="opIdgetPostsBySectionOrTag"></a>

## GET 获取分区或标签下的所有帖子

GET /api/client/section/{sectionId}/posts

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|sectionId|path|integer(int64)| 是 |none|
|tagId|query|integer(int64)| 否 |none|
|current|query|integer(int64)| 否 |none|
|size|query|integer(int64)| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPagePost](#schemaresppagepost)|

<a id="opIdsearchPostsBySection"></a>

## GET 按分区和关键字搜索帖子

GET /api/client/section/{sectionId}/posts/search

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|sectionId|path|integer(int64)| 是 |none|
|keyword|query|string| 否 |none|
|current|query|integer(int64)| 否 |none|
|size|query|integer(int64)| 否 |none|
|sortBy|query|string| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPagePost](#schemaresppagepost)|

<a id="opIdgetAllSections"></a>

## GET 获取所有分区

GET /api/client/section/all

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

# 用户端/客户端搜索模块

<a id="opIdgetSearchHistory"></a>

## GET 获取用户的搜索历史

GET /api/client/search/searchHistory

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdsearchPostsByTagAndKey"></a>

## GET 通过标签和关键词搜索帖子

GET /api/client/search/searchByTagAndKey

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|tagId|query|integer(int64)| 是 |none|
|current|query|integer(int64)| 是 |none|
|size|query|integer(int64)| 是 |none|
|keyword|query|string| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[PagePost](#schemapagepost)|

<a id="opIdsearchPostsByKeyword"></a>

## GET 根据关键词搜索帖子

GET /api/client/search/searchByKeyword

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 是 |none|
|size|query|integer(int64)| 是 |none|
|keyword|query|string| 是 |none|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[PagePost](#schemapagepost)|

<a id="opIdsearchPosts"></a>

## GET ES全文搜索帖子

GET /api/client/search/es/posts

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|keyword|query|string| 是 |none|
|page|query|integer(int32)| 否 |none|
|size|query|integer(int32)| 否 |none|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespSearchResultPost](#schemarespsearchresultpost)|

<a id="opIdgetPostsByTag"></a>

## GET 获取指定标签下的所有帖子

GET /api/client/search/byTag/{tagId}/posts

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|tagId|path|integer(int64)| 是 |none|
|current|query|integer(int64)| 是 |none|
|size|query|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPagePost](#schemaresppagepost)|

<a id="opIdgetPostsBySection"></a>

## GET 获取指定分区下的所有帖子

GET /api/client/search/bySection/{sectionId}/posts

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|sectionId|path|integer(int64)| 是 |none|
|page|query|integer(int64)| 是 |none|
|size|query|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPagePost](#schemaresppagepost)|

# 用户端/客户端推荐接口

<a id="opIdgetSearchRecommendations"></a>

## GET 获取搜索关键词推荐

GET /api/client/recommendation/search

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|size|query|integer(int32)| 否 |推荐数量|
|token|header|string| 是 |token|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListString](#schemarespliststring)|

<a id="opIdgetRelatedPosts"></a>

## GET 获取相关帖子推荐

GET /api/client/recommendation/posts/related

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|query|integer(int64)| 是 |帖子ID|
|size|query|integer(int32)| 否 |推荐数量|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListRecommendationDTO](#schemaresplistrecommendationdto)|

# 用户端/客户端排行榜相关接口

<a id="opIdgetWeeklyRank"></a>

## GET 获取周榜

GET /api/client/rank/weekly

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListPost](#schemaresplistpost)|

<a id="opIdgetMonthlyRank"></a>

## GET 获取月榜

GET /api/client/rank/monthly

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListPost](#schemaresplistpost)|

<a id="opIdgetDailyRank"></a>

## GET 获取日榜

GET /api/client/rank/daily

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListPost](#schemaresplistpost)|

# 用户端/客户端个人中心个人评论管理

<a id="opIdgetCommentDetail"></a>

## GET 获取评论详情

GET /api/client/personal/comment/{commentId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|commentId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespComment](#schemarespcomment)|

<a id="opIddeleteComment_2"></a>

## DELETE 删除评论

DELETE /api/client/personal/comment/{commentId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|commentId|path|integer(int64)| 是 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetReceivedComments"></a>

## GET 获取我收到的评论列表

GET /api/client/personal/comment/received

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |当前页|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageComment](#schemaresppagecomment)|

<a id="opIdgetMyComments"></a>

## GET 获取我发布的评论列表

GET /api/client/personal/comment/published

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |当前页|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageComment](#schemaresppagecomment)|

# 用户端/客户端首页管理

<a id="opIdgetHomePageData"></a>

## GET 获取首页数据

GET /api/client/homepage

获取首页所需的所有数据，包括用户信息、推荐内容、分区和通知

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespHomePageVO](#schemaresphomepagevo)|

<a id="opIdgetUserBrief"></a>

## GET 获取用户简要信息

GET /api/client/homepage/user-brief

获取当前登录用户的简要信息

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespUserBriefVO](#schemarespuserbriefvo)|

<a id="opIdgetSections"></a>

## GET 获取分区列表

GET /api/client/homepage/sections

获取所有可用分区信息

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListSectionVO](#schemaresplistsectionvo)|

<a id="opIdgetRecommendContents"></a>

## GET 获取推荐内容

GET /api/client/homepage/recommend

获取首页推荐内容列表

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|limit|query|integer(int32)| 否 |获取数量限制|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListRecommendContentVO](#schemaresplistrecommendcontentvo)|

<a id="opIdgetNotifications"></a>

## GET 获取通知列表

GET /api/client/homepage/notifications

获取当前用户的通知消息

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|limit|query|integer(int32)| 否 |获取数量限制|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListNotificationVO](#schemaresplistnotificationvo)|

# 系统级/系统级通知管理接口

<a id="opIdmarkAsRead"></a>

## PUT 标记通知为已读

PUT /system/notification/read/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |通知ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdmarkAllAsRead"></a>

## PUT 标记所有通知为已读

PUT /system/notification/read-all

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |用户ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdsendNotification"></a>

## POST 发送通知

POST /system/notification/send

> Body 请求参数

```json
{
  "id": 0,
  "userSenderId": 0,
  "userReceiverId": 0,
  "title": "string",
  "content": "string",
  "type": 0,
  "status": 0,
  "creationTime": "2019-08-24T14:15:22Z",
  "readTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|any| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetUnreadCount"></a>

## GET 获取未读通知数量

GET /system/notification/unread-count

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |用户ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespLong](#schemaresplong)|

<a id="opIdgetUserNotifications"></a>

## GET 获取用户通知列表

GET /system/notification/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |用户ID|
|type|query|integer(int32)| 否 |通知类型(1:评论回复 2:点赞 3:系统通知)|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIddeleteNotification"></a>

## DELETE 删除通知

DELETE /system/notification/delete/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |通知ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

# 系统级/系统级用户管理

<a id="opIdupdate"></a>

## PUT 更新用户信息

PUT /api/system/user

> Body 请求参数

```json
{
  "id": 0,
  "username": "string",
  "email": "string",
  "phoneNumber": "string",
  "registrationTime": "2019-08-24T14:15:22Z",
  "lastLoginTime": "2019-08-24T14:15:22Z",
  "lastLoginLocation": "string",
  "lastUpdatedTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0,
  "isAdmin": 0,
  "isFrozen": 0,
  "permissionLevel": 0,
  "gender": 0,
  "birthDate": "2019-08-24",
  "bio": "string",
  "avatar": "string",
  "followingCount": 0,
  "followersCount": 0,
  "reviewStatus": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[User](#schemauser)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdsave"></a>

## POST 新增用户

POST /api/system/user

> Body 请求参数

```json
{
  "id": 0,
  "username": "string",
  "email": "string",
  "phoneNumber": "string",
  "registrationTime": "2019-08-24T14:15:22Z",
  "lastLoginTime": "2019-08-24T14:15:22Z",
  "lastLoginLocation": "string",
  "lastUpdatedTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0,
  "isAdmin": 0,
  "isFrozen": 0,
  "permissionLevel": 0,
  "gender": 0,
  "birthDate": "2019-08-24",
  "bio": "string",
  "avatar": "string",
  "followingCount": 0,
  "followersCount": 0,
  "reviewStatus": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[User](#schemauser)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdupdateUserLoginInfo"></a>

## PUT 更新用户登录信息

PUT /api/system/user/login-info

> Body 请求参数

```json
{
  "id": 0,
  "username": "string",
  "email": "string",
  "phoneNumber": "string",
  "registrationTime": "2019-08-24T14:15:22Z",
  "lastLoginTime": "2019-08-24T14:15:22Z",
  "lastLoginLocation": "string",
  "lastUpdatedTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0,
  "isAdmin": 0,
  "isFrozen": 0,
  "permissionLevel": 0,
  "gender": 0,
  "birthDate": "2019-08-24",
  "bio": "string",
  "avatar": "string",
  "followingCount": 0,
  "followersCount": 0,
  "reviewStatus": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[User](#schemauser)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdregister"></a>

## POST 用户注册

POST /api/system/user/register

> Body 请求参数

```json
{
  "username": "string",
  "password": "string",
  "phoneNumber": "string",
  "captcha": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[RegisterDTO](#schemaregisterdto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespUser](#schemarespuser)|

<a id="opIdlogin"></a>

## POST 用户登录

POST /api/system/user/login

> Body 请求参数

```json
{
  "username": "string",
  "phoneNumber": "string",
  "password": "string",
  "captcha": "string",
  "loginType": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[LoginDTO](#schemalogindto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespUser](#schemarespuser)|

<a id="opIdgetUserById"></a>

## GET 根据ID获取用户信息

GET /api/system/user/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |用户ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespUser](#schemarespuser)|

<a id="opIddelete"></a>

## DELETE 删除用户

DELETE /api/system/user/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |用户ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetUserByPhone"></a>

## GET 根据手机号获取用户信息

GET /api/system/user/phone/{phoneNumber}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|phoneNumber|path|string| 是 |手机号|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespUser](#schemarespuser)|

# 系统级/系统级标签管理

<a id="opIdupdateTag"></a>

## PUT 更新标签

PUT /api/system/tag

> Body 请求参数

```json
{
  "id": 0,
  "tagName": "string",
  "tagDescription": "string",
  "sectionId": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[TagUpdateDTO](#schematagupdatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespTag](#schemaresptag)|

<a id="opIdcreateTag"></a>

## POST 创建标签

POST /api/system/tag

> Body 请求参数

```json
{
  "tagName": "string",
  "tagDescription": "string",
  "sectionId": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[TagCreateDTO](#schematagcreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespTag](#schemaresptag)|

<a id="opIdgetTag"></a>

## GET 获取标签详情

GET /api/system/tag/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |标签ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespTag](#schemaresptag)|

<a id="opIddeleteTag"></a>

## DELETE 删除标签

DELETE /api/system/tag/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |标签ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdgetTagsBySection"></a>

## GET 获取分区下的所有标签

GET /api/system/tag/section/{sectionId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|sectionId|path|integer(int64)| 是 |分区ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListTag](#schemaresplisttag)|

<a id="opIdqueryTags"></a>

## GET 分页查询标签

GET /api/system/tag/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|keyword|query|string| 否 |none|
|sectionId|query|integer(int64)| 否 |none|
|pageNum|query|integer(int32)| 否 |none|
|pageSize|query|integer(int32)| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageTag](#schemaresppagetag)|

# 系统级/系统级分区管理接口

<a id="opIdupdateSection"></a>

## PUT 更新分区

PUT /api/system/section/update

> Body 请求参数

```json
{
  "id": 0,
  "sectionName": "string",
  "sectionDescription": "string",
  "creationTime": "2019-08-24T14:15:22Z",
  "updateTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0,
  "visibility": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|any| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdtoggleVisibility"></a>

## PUT 切换分区可见性

PUT /api/system/section/toggle-visibility/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |分区ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdcreateSection"></a>

## POST 创建分区

POST /api/system/section/create

> Body 请求参数

```json
{
  "id": 0,
  "sectionName": "string",
  "sectionDescription": "string",
  "creationTime": "2019-08-24T14:15:22Z",
  "updateTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0,
  "visibility": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|any| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdlistSections"></a>

## GET 分页查询分区

GET /api/system/section/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 是 |页码|
|size|query|integer(int64)| 是 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetSection"></a>

## GET 获取分区详情

GET /api/system/section/get/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |分区ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIddeleteSection"></a>

## DELETE 删除分区

DELETE /api/system/section/delete/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |分区ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

# 系统级/系统级审核日志管理接口

<a id="opIdupdateReviewStatus"></a>

## PUT 更新审核状态

PUT /api/system/review/status/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |审核记录ID|
|status|query|integer(int32)| 是 |审核状态(0:待审核 1:已通过 2:已拒绝)|
|notes|query|string| 否 |审核备注|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdbatchReview"></a>

## PUT 批量审核

PUT /api/system/review/batch

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|ids|query|array[integer]| 是 |审核记录ID数组|
|status|query|integer(int32)| 是 |审核状态(1:通过 2:拒绝)|
|notes|query|string| 否 |审核备注|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdcreateReviewLog"></a>

## POST 创建审核记录

POST /api/system/review/create

> Body 请求参数

```json
{
  "id": 0,
  "contentId": 0,
  "contentType": 0,
  "reviewerId": 0,
  "reviewStatus": 0,
  "reviewTime": "2019-08-24T14:15:22Z",
  "reviewNotes": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|any| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetReviewerLogs"></a>

## GET 获取审核人的审核记录

GET /api/system/review/reviewer/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|reviewerId|query|integer(int64)| 是 |审核人ID|
|status|query|integer(int32)| 否 |审核状态(0:待审核 1:已通过 2:已拒绝)|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetPendingReviews"></a>

## GET 获取待审核列表

GET /api/system/review/pending/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|contentType|query|integer(int32)| 否 |内容类型(0:用户 1:帖子 2:合集 3:收藏夹)|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetContentReviews"></a>

## GET 获取内容的审核记录

GET /api/system/review/content/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|contentId|query|integer(int64)| 是 |内容ID|
|contentType|query|integer(int32)| 是 |内容类型(0:用户 1:帖子 2:合集 3:收藏夹)|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

# 系统级/系统级举报对象类型管理

<a id="opIdupdateReportedType"></a>

## PUT 更新举报对象类型

PUT /api/system/reported-type

> Body 请求参数

```json
{
  "id": 0,
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[ReportedTypeUpdateDTO](#schemareportedtypeupdatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespReportedType](#schemarespreportedtype)|

<a id="opIdcreateReportedType"></a>

## POST 创建举报对象类型

POST /api/system/reported-type

> Body 请求参数

```json
{
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[ReportedTypeCreateDTO](#schemareportedtypecreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespReportedType](#schemarespreportedtype)|

<a id="opIdgetReportedType"></a>

## GET 获取举报对象类型详情

GET /api/system/reported-type/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |举报对象类型ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespReportedType](#schemarespreportedtype)|

<a id="opIddeleteReportedType"></a>

## DELETE 删除举报对象类型

DELETE /api/system/reported-type/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |举报对象类型ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

<a id="opIdlistReportedTypes"></a>

## GET 获取举报对象类型列表

GET /api/system/reported-type/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|typeName|query|string| 否 |举报对象类型名称|
|isActive|query|integer(int32)| 否 |是否启用|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageReportedType](#schemaresppagereportedtype)|

# 系统级/系统级举报管理

<a id="opIdupdateReport"></a>

## PUT 更新举报

PUT /api/system/report

> Body 请求参数

```json
{
  "id": 0,
  "status": 0,
  "outcome": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[ReportUpdateDTO](#schemareportupdatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespReport](#schemarespreport)|

<a id="opIdcreateReport"></a>

## POST 创建举报

POST /api/system/report

> Body 请求参数

```json
{
  "userId": 0,
  "reportedContentId": 0,
  "reportedTypeId": 0,
  "reportTypeId": 0,
  "reason": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[ReportCreateDTO](#schemareportcreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespReport](#schemarespreport)|

<a id="opIdqueryReports"></a>

## POST 查询举报列表

POST /api/system/report/list

> Body 请求参数

```json
{
  "current": 0,
  "size": 0,
  "userId": 0,
  "reportedTypeId": 0,
  "reportTypeId": 0,
  "status": 0,
  "startTime": "2019-08-24T14:15:22Z",
  "endTime": "2019-08-24T14:15:22Z"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[ReportQueryDTO](#schemareportquerydto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageReport](#schemaresppagereport)|

<a id="opIdgetReport"></a>

## GET 获取举报详情

GET /api/system/report/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |举报ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespReport](#schemarespreport)|

<a id="opIddeleteReport"></a>

## DELETE 删除举报

DELETE /api/system/report/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |举报ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

# 系统级/系统级举报类型管理

<a id="opIdupdateReportType"></a>

## PUT 更新举报类型

PUT /api/system/report-type

> Body 请求参数

```json
{
  "id": 0,
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[ReportTypeUpdateDTO](#schemareporttypeupdatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespReportType](#schemarespreporttype)|

<a id="opIdcreateReportType"></a>

## POST 创建举报类型

POST /api/system/report-type

> Body 请求参数

```json
{
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[ReportTypeCreateDTO](#schemareporttypecreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespReportType](#schemarespreporttype)|

<a id="opIdgetReportType"></a>

## GET 获取举报类型详情

GET /api/system/report-type/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |举报类型ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespReportType](#schemarespreporttype)|

<a id="opIddeleteReportType"></a>

## DELETE 删除举报类型

DELETE /api/system/report-type/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |举报类型ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

<a id="opIdlistReportTypes"></a>

## GET 获取举报类型列表

GET /api/system/report-type/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|typeName|query|string| 否 |举报类型名称|
|isActive|query|integer(int32)| 否 |是否启用|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageReportType](#schemaresppagereporttype)|

# 系统级/系统级帖子管理接口

<a id="opIdupdatePost"></a>

## PUT 更新帖子

PUT /api/system/post

> Body 请求参数

```json
{
  "id": 0,
  "sectionId": 0,
  "tags": "string",
  "cover": "string",
  "summary": "string",
  "citation": "string",
  "collectionId": 0,
  "title": "string",
  "contentFileId": "string",
  "contentFilePath": "string",
  "visibility": 0,
  "status": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[PostUpdateDTO](#schemapostupdatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPost](#schemaresppost)|

<a id="opIdcreatePost"></a>

## POST 创建帖子

POST /api/system/post

> Body 请求参数

```json
{
  "userId": 0,
  "sectionId": 0,
  "tags": "string",
  "cover": "string",
  "summary": "string",
  "citation": "string",
  "collectionId": 0,
  "title": "string",
  "contentFileId": "string",
  "contentFilePath": "string",
  "visibility": 0,
  "status": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[PostCreateDTO](#schemapostcreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPost](#schemaresppost)|

<a id="opIdupdateStatus"></a>

## PUT 更新帖子状态

PUT /api/system/post/{id}/status/{status}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |帖子ID|
|status|path|integer(int32)| 是 |状态(1:已发布,0:草稿)|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdupdateReviewStatus_1"></a>

## PUT 更新帖子审核状态

PUT /api/system/post/{id}/review/{reviewStatus}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |帖子ID|
|reviewStatus|path|integer(int32)| 是 |审核状态(0:待审核,1:已通过,2:已拒绝)|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdupdatePinned"></a>

## PUT 设置/取消置顶

PUT /api/system/post/{id}/pinned/{isPinned}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |帖子ID|
|isPinned|path|integer(int32)| 是 |是否置顶(1:是,0:否)|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdupdateEssence"></a>

## PUT 设置/取消精华

PUT /api/system/post/{id}/essence/{isEssence}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |帖子ID|
|isEssence|path|integer(int32)| 是 |是否精华(1:是,0:否)|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdgetPost"></a>

## GET 获取帖子详情

GET /api/system/post/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |帖子ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPost](#schemaresppost)|

<a id="opIddeletePost"></a>

## DELETE 删除帖子

DELETE /api/system/post/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |帖子ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdqueryPosts"></a>

## GET 分页查询帖子

GET /api/system/post/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 否 |none|
|sectionId|query|integer(int64)| 否 |none|
|tags|query|string| 否 |none|
|collectionId|query|integer(int64)| 否 |none|
|keyword|query|string| 否 |none|
|status|query|integer(int32)| 否 |none|
|visibility|query|integer(int32)| 否 |none|
|reviewStatus|query|integer(int32)| 否 |none|
|startTime|query|string| 否 |none|
|endTime|query|string| 否 |none|
|pageNum|query|integer(int32)| 否 |none|
|pageSize|query|integer(int32)| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPagePost](#schemaresppagepost)|

# 系统级/系统级收藏夹管理接口

<a id="opIdupdateVisibility"></a>

## PUT 更新收藏夹可见性

PUT /api/system/folder/visibility/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |收藏夹ID|
|visibility|query|integer(int32)| 是 |可见性(0:自己可见 1:公开可见)|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdupdateFolder"></a>

## PUT 更新收藏夹

PUT /api/system/folder/update

> Body 请求参数

```json
{
  "id": 0,
  "userId": 0,
  "folderName": "string",
  "creationTime": "2019-08-24T14:15:22Z",
  "updateTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0,
  "reviewStatus": 0,
  "visibility": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|any| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdupdateReviewStatus_2"></a>

## PUT 更新审核状态

PUT /api/system/folder/review/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |收藏夹ID|
|status|query|integer(int32)| 是 |审核状态(0:待审核 1:已通过 2:已拒绝)|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdcreateFolder"></a>

## POST 创建收藏夹

POST /api/system/folder/create

> Body 请求参数

```json
{
  "id": 0,
  "userId": 0,
  "folderName": "string",
  "creationTime": "2019-08-24T14:15:22Z",
  "updateTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0,
  "reviewStatus": 0,
  "visibility": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|any| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetUserFolders"></a>

## GET 获取用户的收藏夹列表

GET /api/system/folder/user/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |用户ID|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetPublicFolders"></a>

## GET 获取公开的收藏夹列表

GET /api/system/folder/public/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIddeleteFolder"></a>

## DELETE 删除收藏夹

DELETE /api/system/folder/delete/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |收藏夹ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

# 系统级/系统级收藏管理接口

<a id="opIdmoveFavorite"></a>

## PUT 移动收藏到其他收藏夹

PUT /api/system/favorite/move/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |收藏ID|
|newFolderId|query|integer(int64)| 是 |新收藏夹ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdbatchMoveFavorites"></a>

## PUT 批量移动收藏

PUT /api/system/favorite/batch/move

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|ids|query|array[integer]| 是 |收藏ID数组|
|newFolderId|query|integer(int64)| 是 |新收藏夹ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdaddFavorite"></a>

## POST 添加收藏

POST /api/system/favorite/add

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |用户ID|
|postId|query|integer(int64)| 是 |帖子ID|
|folderId|query|integer(int64)| 是 |收藏夹ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetUserFavorites"></a>

## GET 获取用户的收藏列表

GET /api/system/favorite/user/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |用户ID|
|folderId|query|integer(int64)| 否 |收藏夹ID|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetPostFavoriteCount"></a>

## GET 获取帖子的收藏数量

GET /api/system/favorite/post/count

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|query|integer(int64)| 是 |帖子ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespLong](#schemaresplong)|

<a id="opIdcheckFavorite"></a>

## GET 检查用户是否已收藏帖子

GET /api/system/favorite/check

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |用户ID|
|postId|query|integer(int64)| 是 |帖子ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdcancelFavorite"></a>

## DELETE 取消收藏

DELETE /api/system/favorite/cancel

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |用户ID|
|postId|query|integer(int64)| 是 |帖子ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

# 系统级/系统级评论管理

<a id="opIdupdateReviewStatus_3"></a>

## PUT 更新评论审核状态

PUT /api/system/comment/{id}/review-status/{status}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |评论ID|
|status|path|integer(int32)| 是 |审核状态(0:待审核 1:已通过 2:已拒绝)|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdcreateComment"></a>

## POST 创建评论

POST /api/system/comment

> Body 请求参数

```json
{
  "commenterId": 0,
  "commentableId": 0,
  "commentableType": 0,
  "content": "string",
  "parentCommentId": 0,
  "isPublic": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[CommentCreateDTO](#schemacommentcreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespComment](#schemarespcomment)|

<a id="opIdqueryComments"></a>

## POST 查询评论列表

POST /api/system/comment/list

> Body 请求参数

```json
{
  "current": 0,
  "size": 0,
  "commenterId": 0,
  "commentableId": 0,
  "commentableType": 0,
  "parentCommentId": 0,
  "reviewStatus": 0,
  "startTime": "2019-08-24T14:15:22Z",
  "endTime": "2019-08-24T14:15:22Z"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[CommentQueryDTO](#schemacommentquerydto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageComment](#schemaresppagecomment)|

<a id="opIdgetComment"></a>

## GET 获取评论详情

GET /api/system/comment/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |评论ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespComment](#schemarespcomment)|

<a id="opIddeleteComment"></a>

## DELETE 删除评论

DELETE /api/system/comment/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |评论ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

# 系统级/系统级合集管理

<a id="opIdupdateCollection"></a>

## PUT 更新合集

PUT /api/system/collection

> Body 请求参数

```json
{
  "id": 0,
  "collectionName": "string",
  "collectionDescription": "string",
  "visibility": 0,
  "reviewStatus": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[CollectionUpdateDTO](#schemacollectionupdatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCollection](#schemarespcollection)|

<a id="opIdcreateCollection_1"></a>

## POST 创建合集

POST /api/system/collection

> Body 请求参数

```json
{
  "collectionName": "string",
  "collectionDescription": "string",
  "creatorId": 0,
  "visibility": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[CollectionCreateDTO](#schemacollectioncreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCollection](#schemarespcollection)|

<a id="opIdqueryCollections"></a>

## POST 查询合集列表

POST /api/system/collection/list

> Body 请求参数

```json
{
  "current": 0,
  "size": 0,
  "collectionName": "string",
  "creatorId": 0,
  "visibility": 0,
  "reviewStatus": 0,
  "startTime": "2019-08-24T14:15:22Z",
  "endTime": "2019-08-24T14:15:22Z"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[CollectionQueryDTO](#schemacollectionquerydto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageCollection](#schemaresppagecollection)|

<a id="opIdgetCollection"></a>

## GET 获取合集详情

GET /api/system/collection/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |合集ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCollection](#schemarespcollection)|

<a id="opIddeleteCollection"></a>

## DELETE 删除合集

DELETE /api/system/collection/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |合集ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

# 系统级/系统级引用管理

<a id="opIdupdateCitation"></a>

## PUT 更新引用

PUT /api/system/citation

> Body 请求参数

```json
{
  "id": 0,
  "citationTypeId": 0,
  "citationContent": "string",
  "source": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[CitationUpdateDTO](#schemacitationupdatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCitation](#schemarespcitation)|

<a id="opIdcreateCitation"></a>

## POST 创建引用

POST /api/system/citation

> Body 请求参数

```json
{
  "postId": 0,
  "citationTypeId": 0,
  "citationContent": "string",
  "source": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[CitationCreateDTO](#schemacitationcreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCitation](#schemarespcitation)|

<a id="opIdgetCitation"></a>

## GET 获取引用详情

GET /api/system/citation/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |引用ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCitation](#schemarespcitation)|

<a id="opIddeleteCitation"></a>

## DELETE 删除引用

DELETE /api/system/citation/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |引用ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdgetPostCitations"></a>

## GET 获取帖子的所有引用

GET /api/system/citation/post/{postId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|path|integer(int64)| 是 |帖子ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespListCitation](#schemaresplistcitation)|

<a id="opIdqueryCitations"></a>

## GET 分页查询引用

GET /api/system/citation/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|postId|query|integer(int64)| 否 |帖子ID|
|citationTypeId|query|integer(int64)| 否 |引用类型ID|
|startTime|query|string(date-time)| 否 |开始时间|
|endTime|query|string(date-time)| 否 |结束时间|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageCitation](#schemaresppagecitation)|

# 系统级/系统级引用类型管理

<a id="opIdupdateCitationType"></a>

## PUT 更新引用类型

PUT /api/system/citation-type

> Body 请求参数

```json
{
  "id": 0,
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[CitationTypeUpdateDTO](#schemacitationtypeupdatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCitationType](#schemarespcitationtype)|

<a id="opIdcreateCitationType"></a>

## POST 创建引用类型

POST /api/system/citation-type

> Body 请求参数

```json
{
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[CitationTypeCreateDTO](#schemacitationtypecreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCitationType](#schemarespcitationtype)|

<a id="opIdgetCitationType"></a>

## GET 获取引用类型详情

GET /api/system/citation-type/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |引用类型ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCitationType](#schemarespcitationtype)|

<a id="opIddeleteCitationType"></a>

## DELETE 删除引用类型

DELETE /api/system/citation-type/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |引用类型ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

<a id="opIdlistCitationTypes"></a>

## GET 获取引用类型列表

GET /api/system/citation-type/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|typeName|query|string| 否 |引用类型名称|
|isActive|query|integer(int32)| 否 |是否启用|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageCitationType](#schemaresppagecitationtype)|

# 系统级/系统级MinIO测试接口

<a id="opIdupload"></a>

## POST upload

POST /api/test/minio/upload

> Body 请求参数

```json
{
  "file": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|object| 否 |none|
|» file|body|string(binary)| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|string|

<a id="opIdtest"></a>

## POST test

POST /api/test/minio/test

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|string|

# 系统级/系统级浏览记录管理接口

<a id="opIdrecordView"></a>

## POST 记录浏览

POST /api/system/view/record

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |用户ID|
|postId|query|integer(int64)| 是 |帖子ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdgetUserViews"></a>

## GET 获取用户的浏览记录

GET /api/system/view/user/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |用户ID|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetPostViews"></a>

## GET 获取帖子的浏览记录

GET /api/system/view/post/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|query|integer(int64)| 是 |帖子ID|
|current|query|integer(int64)| 否 |页码|
|size|query|integer(int64)| 否 |每页大小|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|

### 返回数据结构

<a id="opIdgetPostViewCount"></a>

## GET 获取帖子的浏览次数

GET /api/system/view/post/count

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|postId|query|integer(int64)| 是 |帖子ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespLong](#schemaresplong)|

<a id="opIddeleteView"></a>

## DELETE 删除浏览记录

DELETE /api/system/view/delete/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |浏览记录ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIddeleteUserViews"></a>

## DELETE 批量删除用户的浏览记录

DELETE /api/system/view/delete/user/{userId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|path|integer(int64)| 是 |用户ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

# 系统级/系统级分享管理

<a id="opIdcreateShare"></a>

## POST 创建分享

POST /api/system/share

> Body 请求参数

```json
{
  "userId": 0,
  "shareObjectId": 0,
  "shareObjectType": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[ShareCreateDTO](#schemasharecreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespShare](#schemarespshare)|

<a id="opIdqueryShares"></a>

## POST 查询分享列表

POST /api/system/share/list

> Body 请求参数

```json
{
  "current": 0,
  "size": 0,
  "userId": 0,
  "shareObjectId": 0,
  "shareObjectType": 0,
  "startTime": "2019-08-24T14:15:22Z",
  "endTime": "2019-08-24T14:15:22Z"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[ShareQueryDTO](#schemasharequerydto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageShare](#schemaresppageshare)|

<a id="opIdgetShare"></a>

## GET 获取分享详情

GET /api/system/share/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |分享ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespShare](#schemarespshare)|

<a id="opIddeleteShare"></a>

## DELETE 删除分享

DELETE /api/system/share/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |分享ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

# 系统级/系统级点赞管理接口

<a id="opIdaddLike"></a>

## POST 添加点赞

POST /api/system/like/add

为指定对象添加点赞

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |用户ID|
|objectId|query|integer(int64)| 是 |对象ID|
|objectType|query|integer(int32)| 是 |对象类型(1:帖子 2:合集 3:评论)|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdcheckLiked"></a>

## GET 检查点赞状态

GET /api/system/like/check

检查用户是否已对指定对象点赞

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |用户ID|
|objectId|query|integer(int64)| 是 |对象ID|
|objectType|query|integer(int32)| 是 |对象类型(1:帖子 2:合集 3:评论)|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdcancelLike"></a>

## DELETE 取消点赞

DELETE /api/system/like/cancel

取消指定对象的点赞

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 是 |用户ID|
|objectId|query|integer(int64)| 是 |对象ID|
|objectType|query|integer(int32)| 是 |对象类型(1:帖子 2:合集 3:评论)|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

# 系统级/系统级关注管理

<a id="opIdfollow"></a>

## POST 关注用户

POST /api/system/follow

> Body 请求参数

```json
{
  "followeeId": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|[FollowCreateDTO](#schemafollowcreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

<a id="opIdqueryFollowList"></a>

## GET 查询关注列表或粉丝列表

GET /api/system/follow/list

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|userId|query|integer(int64)| 否 |none|
|type|query|integer(int32)| 否 |none|
|pageNum|query|integer(int32)| 否 |none|
|pageSize|query|integer(int32)| 否 |none|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageUser](#schemaresppageuser)|

<a id="opIdcheckFollow"></a>

## GET 检查是否已关注

GET /api/system/follow/check/{followeeId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|followeeId|path|integer(int64)| 是 |被关注者ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespBoolean](#schemarespboolean)|

<a id="opIdunfollow"></a>

## DELETE 取消关注

DELETE /api/system/follow/{followeeId}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|followeeId|path|integer(int64)| 是 |被关注者ID|
|token|header|string| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespString](#schemarespstring)|

# 系统级/系统级合集订阅管理

<a id="opIdcreateSubscription"></a>

## POST 创建订阅

POST /api/system/collection-subscriptions

> Body 请求参数

```json
{
  "usersId": 0,
  "collectionsId": 0
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[CollectionSubscriptionsCreateDTO](#schemacollectionsubscriptionscreatedto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCollectionSubscriptions](#schemarespcollectionsubscriptions)|

<a id="opIdquerySubscriptions"></a>

## POST 查询订阅列表

POST /api/system/collection-subscriptions/list

> Body 请求参数

```json
{
  "current": 0,
  "size": 0,
  "usersId": 0,
  "collectionsId": 0,
  "startTime": "2019-08-24T14:15:22Z",
  "endTime": "2019-08-24T14:15:22Z"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 是 |none|
|body|body|[CollectionSubscriptionsQueryDTO](#schemacollectionsubscriptionsquerydto)| 否 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespPageCollectionSubscriptions](#schemaresppagecollectionsubscriptions)|

<a id="opIdgetSubscription"></a>

## GET 获取订阅详情

GET /api/system/collection-subscriptions/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |订阅ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespCollectionSubscriptions](#schemarespcollectionsubscriptions)|

<a id="opIdcancelSubscription"></a>

## DELETE 取消订阅

DELETE /api/system/collection-subscriptions/{id}

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|id|path|integer(int64)| 是 |订阅ID|
|token|header|string| 是 |none|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespVoid](#schemarespvoid)|

# 文件上传接口

<a id="opIduploadImage"></a>

## POST 上传图片

POST /api/file/image

> Body 请求参数

```json
{
  "file": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|object| 否 |none|
|» file|body|string(binary)| 是 |图片文件|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespObject](#schemarespobject)|

<a id="opIduploadCover"></a>

## POST 上传帖子封面

POST /api/file/cover

> Body 请求参数

```json
{
  "file": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|object| 否 |none|
|» file|body|string(binary)| 是 |封面文件|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespObject](#schemarespobject)|

<a id="opIduploadContent"></a>

## POST 上传帖子内容

POST /api/file/content

> Body 请求参数

```json
{
  "file": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|object| 否 |none|
|» file|body|string(binary)| 是 |内容文件|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespObject](#schemarespobject)|

<a id="opIduploadAvatar"></a>

## POST 上传头像

POST /api/file/avatar

> Body 请求参数

```json
{
  "file": "string"
}
```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|header|string| 否 |none|
|body|body|object| 否 |none|
|» file|body|string(binary)| 是 |头像文件|

> 返回示例

> 200 Response

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RespObject](#schemarespobject)|

# 数据模型

<h2 id="tocS_Pet">Pet</h2>

<a id="schemapet"></a>
<a id="schema_Pet"></a>
<a id="tocSpet"></a>
<a id="tocspet"></a>

```json
{
  "id": 1,
  "category": {
    "id": 1,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "tagName": "string",
      "tagDescription": "string",
      "sectionId": 0,
      "creationTime": "2019-08-24T14:15:22Z",
      "updateTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0
    }
  ],
  "status": "available"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|true|none||宠物ID编号|
|category|[Category](#schemacategory)|true|none||分组|
|name|string|true|none||名称|
|photoUrls|[string]|true|none||照片URL|
|tags|[[Tag](#schematag)]|true|none||标签|
|status|string|true|none||宠物销售状态|

#### 枚举值

|属性|值|
|---|---|
|status|available|
|status|pending|
|status|sold|

<h2 id="tocS_Category">Category</h2>

<a id="schemacategory"></a>
<a id="schema_Category"></a>
<a id="tocScategory"></a>
<a id="tocscategory"></a>

```json
{
  "id": 1,
  "name": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||分组ID编号|
|name|string|false|none||分组名称|

<h2 id="tocS_PostUpdateDTO">PostUpdateDTO</h2>

<a id="schemapostupdatedto"></a>
<a id="schema_PostUpdateDTO"></a>
<a id="tocSpostupdatedto"></a>
<a id="tocspostupdatedto"></a>

```json
{
  "id": 0,
  "sectionId": 0,
  "tags": "string",
  "cover": "string",
  "summary": "string",
  "citation": "string",
  "collectionId": 0,
  "title": "string",
  "contentFileId": "string",
  "contentFilePath": "string",
  "visibility": 0,
  "status": 0
}

```

更新帖子请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|true|none||帖子ID|
|sectionId|integer(int64)|false|none||分区ID|
|tags|string|false|none||标签，多个标签用逗号分隔|
|cover|string|false|none||封面图片|
|summary|string|false|none||摘要|
|citation|string|false|none||引用信息|
|collectionId|integer(int64)|false|none||所属合集ID|
|title|string|false|none||标题|
|contentFileId|string|false|none||内容文件ID，由文件上传接口返回|
|contentFilePath|string|false|none||内容文件路径，由文件上传接口返回|
|visibility|integer(int32)|false|none||可见性(1:公开 2:私密)|
|status|integer(int32)|false|none||状态(0:草稿 1:已发布)|

<h2 id="tocS_Section对象">Section对象</h2>

<a id="schemasection对象"></a>
<a id="schema_Section对象"></a>
<a id="tocSsection对象"></a>
<a id="tocssection对象"></a>

```json
{
  "id": 0,
  "sectionName": "string",
  "sectionDescription": "string",
  "creationTime": "2019-08-24T14:15:22Z",
  "updateTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0,
  "visibility": 0
}

```

分区信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||主键ID|
|sectionName|string|false|none||分区名称|
|sectionDescription|string|false|none||分区描述|
|creationTime|string(date-time)|false|none||创建时间|
|updateTime|string(date-time)|false|none||更新时间|
|isDeleted|integer(int32)|false|none||是否删除(1:是 0:否)|
|visibility|integer(int32)|false|none||可见性(0:隐藏 1:公开)|

<h2 id="tocS_Post">Post</h2>

<a id="schemapost"></a>
<a id="schema_Post"></a>
<a id="tocSpost"></a>
<a id="tocspost"></a>

```json
{
  "id": 0,
  "userId": 0,
  "sectionId": 0,
  "tags": "string",
  "cover": "string",
  "summary": "string",
  "citation": "string",
  "collectionId": 0,
  "title": "string",
  "contentFileId": "string",
  "contentFilePath": "string",
  "publishTime": "2019-08-24T14:15:22Z",
  "updateTime": "2019-08-24T14:15:22Z",
  "viewCount": 0,
  "commentCount": 0,
  "likeCount": 0,
  "shareCount": 0,
  "status": 0,
  "isPinned": 0,
  "isEssence": 0,
  "visibility": 0,
  "reviewStatus": 0,
  "isDeleted": 0
}

```

帖子实体类

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||主键，唯一标识一个帖子，自增|
|userId|integer(int64)|false|none||关联用户表的id，发布帖子的用户ID|
|sectionId|integer(int64)|false|none||关联分区表的id，帖子所属的分区ID|
|tags|string|false|none||帖子的标签，用于分类和搜索，可以是多个标签的字符串，例如 "标签1, 标签2"|
|cover|string|false|none||帖子封面图片的路径或URL|
|summary|string|false|none||帖子内容的简短描述，用于快速预览|
|citation|string|false|none||帖子中引用的其他内容或来源的详细信息|
|collectionId|integer(int64)|false|none||关联合集表的id，帖子所属的合集ID|
|title|string|false|none||帖子的标题|
|contentFileId|string|false|none||minio的文件id，用于标识富文本内容的文件|
|contentFilePath|string|false|none||minio文件的路径，指向富文本内容的文件|
|publishTime|string(date-time)|false|none||帖子发布的时间|
|updateTime|string(date-time)|false|none||帖子最后一次更新的时间|
|viewCount|integer(int32)|false|none||帖子被浏览的次数|
|commentCount|integer(int32)|false|none||帖子下的评论数量|
|likeCount|integer(int32)|false|none||帖子获得的点赞数量|
|shareCount|integer(int32)|false|none||帖子被分享的次数|
|status|integer(int32)|false|none||帖子的状态，1表示已发布，0表示草稿|
|isPinned|integer(int32)|false|none||区分位，表示帖子是否被置顶显示，1表示是，0表示否|
|isEssence|integer(int32)|false|none||区分位，表示帖子是否被标记为精华，1表示是，0表示否|
|visibility|integer(int32)|false|none||定义谁可以查看帖子，0：自己；1：公开|
|reviewStatus|integer(int32)|false|none||审核状态，0-待审核，1-已通过，2-已拒绝|
|isDeleted|integer(int32)|false|none||逻辑删除字段，1表示已删除，0表示未删除|

<h2 id="tocS_Tag">Tag</h2>

<a id="schematag"></a>
<a id="schema_Tag"></a>
<a id="tocStag"></a>
<a id="tocstag"></a>

```json
{
  "id": 0,
  "tagName": "string",
  "tagDescription": "string",
  "sectionId": 0,
  "creationTime": "2019-08-24T14:15:22Z",
  "updateTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0
}

```

标签实体类

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||主键，唯一标识一个标签，自增|
|tagName|string|false|none||标签的名称，用于用户识别和展示，应该是唯一的|
|tagDescription|string|false|none||标签的详细描述，可以包含标签所代表的主题或分类的额外信息|
|sectionId|integer(int64)|false|none||标签所属的分区ID，关联分区表section的id|
|creationTime|string(date-time)|false|none||标签创建的时间|
|updateTime|string(date-time)|false|none||标签信息最后一次更新的时间|
|isDeleted|integer(int32)|false|none||表示标签是否被删除，1表示是，0表示否|

<h2 id="tocS_RespPost">RespPost</h2>

<a id="schemaresppost"></a>
<a id="schema_RespPost"></a>
<a id="tocSresppost"></a>
<a id="tocsresppost"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "userId": 0,
    "sectionId": 0,
    "tags": "string",
    "cover": "string",
    "summary": "string",
    "citation": "string",
    "collectionId": 0,
    "title": "string",
    "contentFileId": "string",
    "contentFilePath": "string",
    "publishTime": "2019-08-24T14:15:22Z",
    "updateTime": "2019-08-24T14:15:22Z",
    "viewCount": 0,
    "commentCount": 0,
    "likeCount": 0,
    "shareCount": 0,
    "status": 0,
    "isPinned": 0,
    "isEssence": 0,
    "visibility": 0,
    "reviewStatus": 0,
    "isDeleted": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[Post](#schemapost)|false|none||帖子实体类|

<h2 id="tocS_TagUpdateDTO">TagUpdateDTO</h2>

<a id="schematagupdatedto"></a>
<a id="schema_TagUpdateDTO"></a>
<a id="tocStagupdatedto"></a>
<a id="tocstagupdatedto"></a>

```json
{
  "id": 0,
  "tagName": "string",
  "tagDescription": "string",
  "sectionId": 0
}

```

更新标签信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|true|none||none|
|tagName|string|false|none||none|
|tagDescription|string|false|none||none|
|sectionId|integer(int64)|false|none||none|

<h2 id="tocS_FavoriteFolder对象">FavoriteFolder对象</h2>

<a id="schemafavoritefolder对象"></a>
<a id="schema_FavoriteFolder对象"></a>
<a id="tocSfavoritefolder对象"></a>
<a id="tocsfavoritefolder对象"></a>

```json
{
  "id": 0,
  "userId": 0,
  "folderName": "string",
  "creationTime": "2019-08-24T14:15:22Z",
  "updateTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0,
  "reviewStatus": 0,
  "visibility": 0
}

```

收藏夹信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||主键ID|
|userId|integer(int64)|false|none||用户ID|
|folderName|string|false|none||收藏夹名称|
|creationTime|string(date-time)|false|none||创建时间|
|updateTime|string(date-time)|false|none||更新时间|
|isDeleted|integer(int32)|false|none||是否删除(1:是 0:否)|
|reviewStatus|integer(int32)|false|none||审核状态(0:待审核 1:已通过 2:已拒绝)|
|visibility|integer(int32)|false|none||可见性(0:自己可见 1:公开可见)|

<h2 id="tocS_RespString">RespString</h2>

<a id="schemarespstring"></a>
<a id="schema_RespString"></a>
<a id="tocSrespstring"></a>
<a id="tocsrespstring"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|string|false|none||none|

<h2 id="tocS_RespTag">RespTag</h2>

<a id="schemaresptag"></a>
<a id="schema_RespTag"></a>
<a id="tocSresptag"></a>
<a id="tocsresptag"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "tagName": "string",
    "tagDescription": "string",
    "sectionId": 0,
    "creationTime": "2019-08-24T14:15:22Z",
    "updateTime": "2019-08-24T14:15:22Z",
    "isDeleted": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[Tag](#schematag)|false|none||标签实体类|

<h2 id="tocS_User">User</h2>

<a id="schemauser"></a>
<a id="schema_User"></a>
<a id="tocSuser"></a>
<a id="tocsuser"></a>

```json
{
  "id": 0,
  "username": "string",
  "email": "string",
  "phoneNumber": "string",
  "registrationTime": "2019-08-24T14:15:22Z",
  "lastLoginTime": "2019-08-24T14:15:22Z",
  "lastLoginLocation": "string",
  "lastUpdatedTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0,
  "isAdmin": 0,
  "isFrozen": 0,
  "permissionLevel": 0,
  "gender": 0,
  "birthDate": "2019-08-24",
  "bio": "string",
  "avatar": "string",
  "followingCount": 0,
  "followersCount": 0,
  "reviewStatus": 0
}

```

用户信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||用户ID|
|username|string|true|none||用户名|
|email|string|false|none||邮箱|
|phoneNumber|string|false|none||手机号|
|registrationTime|string(date-time)|false|none||注册时间|
|lastLoginTime|string(date-time)|false|none||最后登录时间|
|lastLoginLocation|string|false|none||最后登录地点|
|lastUpdatedTime|string(date-time)|false|none||最后更新时间|
|isDeleted|integer(int32)|false|none||是否删除（0未删除 1已删除）|
|isAdmin|integer(int32)|false|none||是否管理员（0否 1是）|
|isFrozen|integer(int32)|false|none||是否冻结（0否 1是）|
|permissionLevel|integer(int32)|false|none||权限等级（0正常 1禁止评论 2禁止发帖）|
|gender|integer(int32)|false|none||性别（0男 1女 2其他）|
|birthDate|string(date)|false|none||出生日期|
|bio|string|false|none||个人简介|
|avatar|string|false|none||头像URL|
|followingCount|integer(int32)|false|none||关注数|
|followersCount|integer(int32)|false|none||粉丝数|
|reviewStatus|integer(int32)|false|none||审核状态（0待审核 1已通过 2已拒绝）|

<h2 id="tocS_RespBoolean">RespBoolean</h2>

<a id="schemarespboolean"></a>
<a id="schema_RespBoolean"></a>
<a id="tocSrespboolean"></a>
<a id="tocsrespboolean"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|boolean|false|none||none|

<h2 id="tocS_PostCreateDTO">PostCreateDTO</h2>

<a id="schemapostcreatedto"></a>
<a id="schema_PostCreateDTO"></a>
<a id="tocSpostcreatedto"></a>
<a id="tocspostcreatedto"></a>

```json
{
  "userId": 0,
  "sectionId": 0,
  "tags": "string",
  "cover": "string",
  "summary": "string",
  "citation": "string",
  "collectionId": 0,
  "title": "string",
  "contentFileId": "string",
  "contentFilePath": "string",
  "visibility": 0,
  "status": 0
}

```

创建帖子请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|userId|integer(int64)|true|none||用户ID|
|sectionId|integer(int64)|true|none||分区ID|
|tags|string|false|none||标签，多个标签用逗号分隔|
|cover|string|false|none||封面图片|
|summary|string|false|none||摘要|
|citation|string|false|none||引用信息|
|collectionId|integer(int64)|false|none||所属合集ID|
|title|string|true|none||标题|
|contentFileId|string|false|none||内容文件ID，由文件上传接口返回|
|contentFilePath|string|false|none||内容文件路径，由文件上传接口返回|
|visibility|integer(int32)|true|none||可见性(1:公开 0:私密)|
|status|integer(int32)|true|none||状态(0:草稿 1:已发布)|

<h2 id="tocS_ReportedTypeUpdateDTO">ReportedTypeUpdateDTO</h2>

<a id="schemareportedtypeupdatedto"></a>
<a id="schema_ReportedTypeUpdateDTO"></a>
<a id="tocSreportedtypeupdatedto"></a>
<a id="tocsreportedtypeupdatedto"></a>

```json
{
  "id": 0,
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}

```

更新举报对象类型请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|true|none||举报对象类型ID|
|typeName|string|false|none||举报对象类型名称|
|typeDescription|string|false|none||举报对象类型描述|
|isActive|integer(int32)|false|none||是否启用(1:启用 0:未启用)|

<h2 id="tocS_ClientLoginCheckConfig">ClientLoginCheckConfig</h2>

<a id="schemaclientlogincheckconfig"></a>
<a id="schema_ClientLoginCheckConfig"></a>
<a id="tocSclientlogincheckconfig"></a>
<a id="tocsclientlogincheckconfig"></a>

```json
{
  "checkDeleted": 0,
  "checkFrozen": 0,
  "checkAdmin": 0,
  "checkReview": 0
}

```

用户状态检查配置

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|checkDeleted|integer(int32)|false|none||是否检查删除状态（0不检查 1检查）|
|checkFrozen|integer(int32)|false|none||是否检查冻结状态（0不检查 1检查）|
|checkAdmin|integer(int32)|false|none||是否检查管理员权限（0不检查 1检查）|
|checkReview|integer(int32)|false|none||是否检查审核状态（0不检查 1检查）|

<h2 id="tocS_ReportedType">ReportedType</h2>

<a id="schemareportedtype"></a>
<a id="schema_ReportedType"></a>
<a id="tocSreportedtype"></a>
<a id="tocsreportedtype"></a>

```json
{
  "id": 0,
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}

```

举报对象类型实体

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||举报对象类型ID|
|typeName|string|false|none||举报对象类型名称|
|typeDescription|string|false|none||举报对象类型描述|
|isActive|integer(int32)|false|none||是否启用(1:启用 0:未启用)|

<h2 id="tocS_ClientLoginDTO">ClientLoginDTO</h2>

<a id="schemaclientlogindto"></a>
<a id="schema_ClientLoginDTO"></a>
<a id="tocSclientlogindto"></a>
<a id="tocsclientlogindto"></a>

```json
{
  "username": "string",
  "phoneNumber": "string",
  "password": "string",
  "captcha": "string",
  "loginType": 0,
  "lastLoginTime": "2019-08-24T14:15:22Z",
  "lastLoginLocation": "string",
  "checkConfig": {
    "checkDeleted": 0,
    "checkFrozen": 0,
    "checkAdmin": 0,
    "checkReview": 0
  }
}

```

客户端登录请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|username|string|false|none||用户名|
|phoneNumber|string|false|none||手机号|
|password|string|false|none||密码|
|captcha|string|false|none||验证码|
|loginType|integer(int32)|true|none||登录方式：1-用户名密码，2-手机号密码，3-手机号验证码|
|lastLoginTime|string(date-time)|false|none||最后登录时间|
|lastLoginLocation|string|false|none||最后登录地点|
|checkConfig|[ClientLoginCheckConfig](#schemaclientlogincheckconfig)|false|none||用户状态检查配置|

<h2 id="tocS_RespReportedType">RespReportedType</h2>

<a id="schemarespreportedtype"></a>
<a id="schema_RespReportedType"></a>
<a id="tocSrespreportedtype"></a>
<a id="tocsrespreportedtype"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "typeName": "string",
    "typeDescription": "string",
    "isActive": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[ReportedType](#schemareportedtype)|false|none||举报对象类型实体|

<h2 id="tocS_RespMapStringObject">RespMapStringObject</h2>

<a id="schemarespmapstringobject"></a>
<a id="schema_RespMapStringObject"></a>
<a id="tocSrespmapstringobject"></a>
<a id="tocsrespmapstringobject"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "property1": {},
    "property2": {}
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|object|false|none||none|
|» **additionalProperties**|object|false|none||none|

<h2 id="tocS_ReportUpdateDTO">ReportUpdateDTO</h2>

<a id="schemareportupdatedto"></a>
<a id="schema_ReportUpdateDTO"></a>
<a id="tocSreportupdatedto"></a>
<a id="tocsreportupdatedto"></a>

```json
{
  "id": 0,
  "status": 0,
  "outcome": 0
}

```

更新举报请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|true|none||举报ID|
|status|integer(int32)|false|none||处理状态(0:待处理 1:正在处理 2:已处理 3:无需处理)|
|outcome|integer(int32)|false|none||处理结果(0:无行动 1:内容已删除 2:警告用户 3:用户禁言 4:用户封禁)|

<h2 id="tocS_ClientRegisterDTO">ClientRegisterDTO</h2>

<a id="schemaclientregisterdto"></a>
<a id="schema_ClientRegisterDTO"></a>
<a id="tocSclientregisterdto"></a>
<a id="tocsclientregisterdto"></a>

```json
{
  "username": "string",
  "password": "string",
  "phoneNumber": "string",
  "captcha": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|username|string|true|none||none|
|password|string|true|none||none|
|phoneNumber|string|true|none||none|
|captcha|string|true|none||none|

<h2 id="tocS_Report">Report</h2>

<a id="schemareport"></a>
<a id="schema_Report"></a>
<a id="tocSreport"></a>
<a id="tocsreport"></a>

```json
{
  "id": 0,
  "userId": 0,
  "reportedContentId": 0,
  "reportedTypeId": 0,
  "reportTypeId": 0,
  "reason": "string",
  "reportTime": "2019-08-24T14:15:22Z",
  "status": 0,
  "outcome": 0,
  "isDeleted": 0
}

```

举报实体

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||举报ID|
|userId|integer(int64)|false|none||举报用户ID|
|reportedContentId|integer(int64)|false|none||被举报内容ID|
|reportedTypeId|integer(int64)|false|none||举报对象类型ID|
|reportTypeId|integer(int64)|false|none||举报类型ID|
|reason|string|false|none||举报理由|
|reportTime|string(date-time)|false|none||举报时间|
|status|integer(int32)|false|none||处理状态(0:待处理 1:正在处理 2:已处理 3:无需处理)|
|outcome|integer(int32)|false|none||处理结果(0:无行动 1:内容已删除 2:警告用户 3:用户禁言 4:用户封禁)|
|isDeleted|integer(int32)|false|none||是否删除(1:已删除 0:未删除)|

<h2 id="tocS_RespMapStringString">RespMapStringString</h2>

<a id="schemarespmapstringstring"></a>
<a id="schema_RespMapStringString"></a>
<a id="tocSrespmapstringstring"></a>
<a id="tocsrespmapstringstring"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "property1": "string",
    "property2": "string"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|object|false|none||none|
|» **additionalProperties**|string|false|none||none|

<h2 id="tocS_RespReport">RespReport</h2>

<a id="schemarespreport"></a>
<a id="schema_RespReport"></a>
<a id="tocSrespreport"></a>
<a id="tocsrespreport"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "userId": 0,
    "reportedContentId": 0,
    "reportedTypeId": 0,
    "reportTypeId": 0,
    "reason": "string",
    "reportTime": "2019-08-24T14:15:22Z",
    "status": 0,
    "outcome": 0,
    "isDeleted": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[Report](#schemareport)|false|none||举报实体|

<h2 id="tocS_RespVoid">RespVoid</h2>

<a id="schemarespvoid"></a>
<a id="schema_RespVoid"></a>
<a id="tocSrespvoid"></a>
<a id="tocsrespvoid"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {}
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|object|false|none||none|

<h2 id="tocS_TagCreateDTO">TagCreateDTO</h2>

<a id="schematagcreatedto"></a>
<a id="schema_TagCreateDTO"></a>
<a id="tocStagcreatedto"></a>
<a id="tocstagcreatedto"></a>

```json
{
  "tagName": "string",
  "tagDescription": "string",
  "sectionId": 0
}

```

创建标签信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|tagName|string|true|none||none|
|tagDescription|string|false|none||none|
|sectionId|integer(int64)|true|none||none|

<h2 id="tocS_ReportTypeUpdateDTO">ReportTypeUpdateDTO</h2>

<a id="schemareporttypeupdatedto"></a>
<a id="schema_ReportTypeUpdateDTO"></a>
<a id="tocSreporttypeupdatedto"></a>
<a id="tocsreporttypeupdatedto"></a>

```json
{
  "id": 0,
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}

```

更新举报类型请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|true|none||举报类型ID|
|typeName|string|false|none||举报类型名称|
|typeDescription|string|false|none||举报类型描述|
|isActive|integer(int32)|false|none||是否启用(1:启用 0:未启用)|

<h2 id="tocS_ForgetPasswordDTO">ForgetPasswordDTO</h2>

<a id="schemaforgetpassworddto"></a>
<a id="schema_ForgetPasswordDTO"></a>
<a id="tocSforgetpassworddto"></a>
<a id="tocsforgetpassworddto"></a>

```json
{
  "phoneNumber": "string",
  "newPassword": "string",
  "captcha": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|phoneNumber|string|true|none||none|
|newPassword|string|true|none||none|
|captcha|string|true|none||none|

<h2 id="tocS_ReportType">ReportType</h2>

<a id="schemareporttype"></a>
<a id="schema_ReportType"></a>
<a id="tocSreporttype"></a>
<a id="tocsreporttype"></a>

```json
{
  "id": 0,
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}

```

举报类型实体

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||举报类型ID|
|typeName|string|false|none||举报类型名称|
|typeDescription|string|false|none||举报类型描述|
|isActive|integer(int32)|false|none||是否启用(1:启用 0:未启用)|

<h2 id="tocS_DeactivateAccountDTO">DeactivateAccountDTO</h2>

<a id="schemadeactivateaccountdto"></a>
<a id="schema_DeactivateAccountDTO"></a>
<a id="tocSdeactivateaccountdto"></a>
<a id="tocsdeactivateaccountdto"></a>

```json
{
  "password": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|password|string|true|none||none|

<h2 id="tocS_FollowCreateDTO">FollowCreateDTO</h2>

<a id="schemafollowcreatedto"></a>
<a id="schema_FollowCreateDTO"></a>
<a id="tocSfollowcreatedto"></a>
<a id="tocsfollowcreatedto"></a>

```json
{
  "followeeId": 0
}

```

关注信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|followeeId|integer(int64)|true|none||none|

<h2 id="tocS_RespReportType">RespReportType</h2>

<a id="schemarespreporttype"></a>
<a id="schema_RespReportType"></a>
<a id="tocSrespreporttype"></a>
<a id="tocsrespreporttype"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "typeName": "string",
    "typeDescription": "string",
    "isActive": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[ReportType](#schemareporttype)|false|none||举报类型实体|

<h2 id="tocS_ChangePasswordDTO">ChangePasswordDTO</h2>

<a id="schemachangepassworddto"></a>
<a id="schema_ChangePasswordDTO"></a>
<a id="tocSchangepassworddto"></a>
<a id="tocschangepassworddto"></a>

```json
{
  "oldPassword": "string",
  "newPassword": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|oldPassword|string|true|none||none|
|newPassword|string|true|none||none|

<h2 id="tocS_RegisterDTO">RegisterDTO</h2>

<a id="schemaregisterdto"></a>
<a id="schema_RegisterDTO"></a>
<a id="tocSregisterdto"></a>
<a id="tocsregisterdto"></a>

```json
{
  "username": "string",
  "password": "string",
  "phoneNumber": "string",
  "captcha": "string"
}

```

注册信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|username|string|true|none||用户名|
|password|string|true|none||密码|
|phoneNumber|string|true|none||手机号|
|captcha|string|true|none||验证码|

<h2 id="tocS_RespUser">RespUser</h2>

<a id="schemarespuser"></a>
<a id="schema_RespUser"></a>
<a id="tocSrespuser"></a>
<a id="tocsrespuser"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "username": "string",
    "email": "string",
    "phoneNumber": "string",
    "registrationTime": "2019-08-24T14:15:22Z",
    "lastLoginTime": "2019-08-24T14:15:22Z",
    "lastLoginLocation": "string",
    "lastUpdatedTime": "2019-08-24T14:15:22Z",
    "isDeleted": 0,
    "isAdmin": 0,
    "isFrozen": 0,
    "permissionLevel": 0,
    "gender": 0,
    "birthDate": "2019-08-24",
    "bio": "string",
    "avatar": "string",
    "followingCount": 0,
    "followersCount": 0,
    "reviewStatus": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[User](#schemauser)|false|none||用户信息|

<h2 id="tocS_LoginDTO">LoginDTO</h2>

<a id="schemalogindto"></a>
<a id="schema_LoginDTO"></a>
<a id="tocSlogindto"></a>
<a id="tocslogindto"></a>

```json
{
  "username": "string",
  "phoneNumber": "string",
  "password": "string",
  "captcha": "string",
  "loginType": 0
}

```

登录信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|username|string|false|none||用户名|
|phoneNumber|string|false|none||手机号|
|password|string|false|none||密码|
|captcha|string|false|none||验证码|
|loginType|integer(int32)|false|none||登录方式：1-用户名密码，2-手机号密码，3-手机号验证码|

<h2 id="tocS_PostQueryDTO">PostQueryDTO</h2>

<a id="schemapostquerydto"></a>
<a id="schema_PostQueryDTO"></a>
<a id="tocSpostquerydto"></a>
<a id="tocspostquerydto"></a>

```json
{
  "userId": 0,
  "sectionId": 0,
  "tags": "string",
  "collectionId": 0,
  "keyword": "string",
  "status": 0,
  "visibility": 0,
  "reviewStatus": 0,
  "startTime": "string",
  "endTime": "string",
  "pageNum": 0,
  "pageSize": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|userId|integer(int64)|false|none||none|
|sectionId|integer(int64)|false|none||none|
|tags|string|false|none||none|
|collectionId|integer(int64)|false|none||none|
|keyword|string|false|none||none|
|status|integer(int32)|false|none||none|
|visibility|integer(int32)|false|none||none|
|reviewStatus|integer(int32)|false|none||none|
|startTime|string|false|none||none|
|endTime|string|false|none||none|
|pageNum|integer(int32)|false|none||none|
|pageSize|integer(int32)|false|none||none|

<h2 id="tocS_CollectionUpdateDTO">CollectionUpdateDTO</h2>

<a id="schemacollectionupdatedto"></a>
<a id="schema_CollectionUpdateDTO"></a>
<a id="tocScollectionupdatedto"></a>
<a id="tocscollectionupdatedto"></a>

```json
{
  "id": 0,
  "collectionName": "string",
  "collectionDescription": "string",
  "visibility": 0,
  "reviewStatus": 0
}

```

更新合集请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|true|none||合集ID|
|collectionName|string|false|none||合集名称|
|collectionDescription|string|false|none||合集描述|
|visibility|integer(int32)|false|none||可见性(0:私密 1:公开)|
|reviewStatus|integer(int32)|false|none||审核状态(0:待审核 1:已通过 2:已拒绝)|

<h2 id="tocS_OrderItem">OrderItem</h2>

<a id="schemaorderitem"></a>
<a id="schema_OrderItem"></a>
<a id="tocSorderitem"></a>
<a id="tocsorderitem"></a>

```json
{
  "column": "string",
  "asc": true
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|column|string|false|none||none|
|asc|boolean|false|none||none|

<h2 id="tocS_Collection">Collection</h2>

<a id="schemacollection"></a>
<a id="schema_Collection"></a>
<a id="tocScollection"></a>
<a id="tocscollection"></a>

```json
{
  "id": 0,
  "collectionName": "string",
  "collectionDescription": "string",
  "creatorId": 0,
  "creationTime": "2019-08-24T14:15:22Z",
  "updateTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0,
  "likeCount": 0,
  "commentCount": 0,
  "subscribeCount": 0,
  "shareCount": 0,
  "visibility": 0,
  "reviewStatus": 0
}

```

合集实体

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||合集ID|
|collectionName|string|false|none||合集名称|
|collectionDescription|string|false|none||合集描述|
|creatorId|integer(int64)|false|none||创建者ID|
|creationTime|string(date-time)|false|none||创建时间|
|updateTime|string(date-time)|false|none||更新时间|
|isDeleted|integer(int32)|false|none||是否删除(1:已删除 0:未删除)|
|likeCount|integer(int32)|false|none||点赞数|
|commentCount|integer(int32)|false|none||评论数|
|subscribeCount|integer(int32)|false|none||订阅数|
|shareCount|integer(int32)|false|none||分享数|
|visibility|integer(int32)|false|none||可见性(0:私密 1:公开)|
|reviewStatus|integer(int32)|false|none||审核状态(0:待审核 1:已通过 2:已拒绝)|

<h2 id="tocS_PagePost">PagePost</h2>

<a id="schemapagepost"></a>
<a id="schema_PagePost"></a>
<a id="tocSpagepost"></a>
<a id="tocspagepost"></a>

```json
{
  "records": [
    {
      "id": 0,
      "userId": 0,
      "sectionId": 0,
      "tags": "string",
      "cover": "string",
      "summary": "string",
      "citation": "string",
      "collectionId": 0,
      "title": "string",
      "contentFileId": "string",
      "contentFilePath": "string",
      "publishTime": "2019-08-24T14:15:22Z",
      "updateTime": "2019-08-24T14:15:22Z",
      "viewCount": 0,
      "commentCount": 0,
      "likeCount": 0,
      "shareCount": 0,
      "status": 0,
      "isPinned": 0,
      "isEssence": 0,
      "visibility": 0,
      "reviewStatus": 0,
      "isDeleted": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "sectionId": 0,
        "tags": "string",
        "cover": "string",
        "summary": "string",
        "citation": "string",
        "collectionId": 0,
        "title": "string",
        "contentFileId": "string",
        "contentFilePath": "string",
        "publishTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "viewCount": 0,
        "commentCount": 0,
        "likeCount": 0,
        "shareCount": 0,
        "status": 0,
        "isPinned": 0,
        "isEssence": 0,
        "visibility": 0,
        "reviewStatus": 0,
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "sectionId": 0,
          "tags": "string",
          "cover": "string",
          "summary": "string",
          "citation": "string",
          "collectionId": 0,
          "title": "string",
          "contentFileId": "string",
          "contentFilePath": "string",
          "publishTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "viewCount": 0,
          "commentCount": 0,
          "likeCount": 0,
          "shareCount": 0,
          "status": 0,
          "isPinned": 0,
          "isEssence": 0,
          "visibility": 0,
          "reviewStatus": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "sectionId": 0,
          "tags": "string",
          "cover": "string",
          "summary": "string",
          "citation": "string",
          "collectionId": 0,
          "title": "string",
          "contentFileId": "string",
          "contentFilePath": "string",
          "publishTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "viewCount": 0,
          "commentCount": 0,
          "likeCount": 0,
          "shareCount": 0,
          "status": 0,
          "isPinned": 0,
          "isEssence": 0,
          "visibility": 0,
          "reviewStatus": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "sectionId": 0,
        "tags": "string",
        "cover": "string",
        "summary": "string",
        "citation": "string",
        "collectionId": 0,
        "title": "string",
        "contentFileId": "string",
        "contentFilePath": "string",
        "publishTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "viewCount": 0,
        "commentCount": 0,
        "likeCount": 0,
        "shareCount": 0,
        "status": 0,
        "isPinned": 0,
        "isEssence": 0,
        "visibility": 0,
        "reviewStatus": 0,
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "sectionId": 0,
          "tags": "string",
          "cover": "string",
          "summary": "string",
          "citation": "string",
          "collectionId": 0,
          "title": "string",
          "contentFileId": "string",
          "contentFilePath": "string",
          "publishTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "viewCount": 0,
          "commentCount": 0,
          "likeCount": 0,
          "shareCount": 0,
          "status": 0,
          "isPinned": 0,
          "isEssence": 0,
          "visibility": 0,
          "reviewStatus": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "sectionId": 0,
          "tags": "string",
          "cover": "string",
          "summary": "string",
          "citation": "string",
          "collectionId": 0,
          "title": "string",
          "contentFileId": "string",
          "contentFilePath": "string",
          "publishTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "viewCount": 0,
          "commentCount": 0,
          "likeCount": 0,
          "shareCount": 0,
          "status": 0,
          "isPinned": 0,
          "isEssence": 0,
          "visibility": 0,
          "reviewStatus": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[Post](#schemapost)]|false|none||[帖子实体类]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PagePost](#schemapagepost)|false|none||none|
|searchCount|[PagePost](#schemapagepost)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespCollection">RespCollection</h2>

<a id="schemarespcollection"></a>
<a id="schema_RespCollection"></a>
<a id="tocSrespcollection"></a>
<a id="tocsrespcollection"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "collectionName": "string",
    "collectionDescription": "string",
    "creatorId": 0,
    "creationTime": "2019-08-24T14:15:22Z",
    "updateTime": "2019-08-24T14:15:22Z",
    "isDeleted": 0,
    "likeCount": 0,
    "commentCount": 0,
    "subscribeCount": 0,
    "shareCount": 0,
    "visibility": 0,
    "reviewStatus": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[Collection](#schemacollection)|false|none||合集实体|

<h2 id="tocS_RespPagePost">RespPagePost</h2>

<a id="schemaresppagepost"></a>
<a id="schema_RespPagePost"></a>
<a id="tocSresppagepost"></a>
<a id="tocsresppagepost"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "sectionId": 0,
        "tags": "string",
        "cover": "string",
        "summary": "string",
        "citation": "string",
        "collectionId": 0,
        "title": "string",
        "contentFileId": "string",
        "contentFilePath": "string",
        "publishTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "viewCount": 0,
        "commentCount": 0,
        "likeCount": 0,
        "shareCount": 0,
        "status": 0,
        "isPinned": 0,
        "isEssence": 0,
        "visibility": 0,
        "reviewStatus": 0,
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "sectionId": 0,
          "tags": "string",
          "cover": "string",
          "summary": "string",
          "citation": "string",
          "collectionId": 0,
          "title": "string",
          "contentFileId": "string",
          "contentFilePath": "string",
          "publishTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "viewCount": 0,
          "commentCount": 0,
          "likeCount": 0,
          "shareCount": 0,
          "status": 0,
          "isPinned": 0,
          "isEssence": 0,
          "visibility": 0,
          "reviewStatus": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "sectionId": 0,
          "tags": "string",
          "cover": "string",
          "summary": "string",
          "citation": "string",
          "collectionId": 0,
          "title": "string",
          "contentFileId": "string",
          "contentFilePath": "string",
          "publishTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "viewCount": 0,
          "commentCount": 0,
          "likeCount": 0,
          "shareCount": 0,
          "status": 0,
          "isPinned": 0,
          "isEssence": 0,
          "visibility": 0,
          "reviewStatus": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PagePost](#schemapagepost)|false|none||none|

<h2 id="tocS_CitationUpdateDTO">CitationUpdateDTO</h2>

<a id="schemacitationupdatedto"></a>
<a id="schema_CitationUpdateDTO"></a>
<a id="tocScitationupdatedto"></a>
<a id="tocscitationupdatedto"></a>

```json
{
  "id": 0,
  "citationTypeId": 0,
  "citationContent": "string",
  "source": "string"
}

```

更新引用请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|true|none||引用ID|
|citationTypeId|integer(int64)|false|none||引用类型ID|
|citationContent|string|false|none||引用内容|
|source|string|false|none||引用来源|

<h2 id="tocS_Citation">Citation</h2>

<a id="schemacitation"></a>
<a id="schema_Citation"></a>
<a id="tocScitation"></a>
<a id="tocscitation"></a>

```json
{
  "id": 0,
  "postId": 0,
  "citationTypeId": 0,
  "citationContent": "string",
  "source": "string",
  "citationTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0
}

```

引用实体

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||引用ID|
|postId|integer(int64)|false|none||帖子ID|
|citationTypeId|integer(int64)|false|none||引用类型ID|
|citationContent|string|false|none||引用内容|
|source|string|false|none||引用来源|
|citationTime|string(date-time)|false|none||引用时间|
|isDeleted|integer(int32)|false|none||是否删除(1:已删除 0:未删除)|

<h2 id="tocS_RespListTag">RespListTag</h2>

<a id="schemaresplisttag"></a>
<a id="schema_RespListTag"></a>
<a id="tocSresplisttag"></a>
<a id="tocsresplisttag"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "id": 0,
      "tagName": "string",
      "tagDescription": "string",
      "sectionId": 0,
      "creationTime": "2019-08-24T14:15:22Z",
      "updateTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[Tag](#schematag)]|false|none||[标签实体类]|

<h2 id="tocS_RespCitation">RespCitation</h2>

<a id="schemarespcitation"></a>
<a id="schema_RespCitation"></a>
<a id="tocSrespcitation"></a>
<a id="tocsrespcitation"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "postId": 0,
    "citationTypeId": 0,
    "citationContent": "string",
    "source": "string",
    "citationTime": "2019-08-24T14:15:22Z",
    "isDeleted": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[Citation](#schemacitation)|false|none||引用实体|

<h2 id="tocS_TagQueryDTO">TagQueryDTO</h2>

<a id="schematagquerydto"></a>
<a id="schema_TagQueryDTO"></a>
<a id="tocStagquerydto"></a>
<a id="tocstagquerydto"></a>

```json
{
  "keyword": "string",
  "sectionId": 0,
  "pageNum": 0,
  "pageSize": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|keyword|string|false|none||none|
|sectionId|integer(int64)|false|none||none|
|pageNum|integer(int32)|false|none||none|
|pageSize|integer(int32)|false|none||none|

<h2 id="tocS_CitationTypeUpdateDTO">CitationTypeUpdateDTO</h2>

<a id="schemacitationtypeupdatedto"></a>
<a id="schema_CitationTypeUpdateDTO"></a>
<a id="tocScitationtypeupdatedto"></a>
<a id="tocscitationtypeupdatedto"></a>

```json
{
  "id": 0,
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}

```

更新引用类型请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|true|none||引用类型ID|
|typeName|string|false|none||引用类型名称|
|typeDescription|string|false|none||引用类型描述|
|isActive|integer(int32)|false|none||是否启用(1:启用 0:未启用)|

<h2 id="tocS_CitationType">CitationType</h2>

<a id="schemacitationtype"></a>
<a id="schema_CitationType"></a>
<a id="tocScitationtype"></a>
<a id="tocscitationtype"></a>

```json
{
  "id": 0,
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}

```

引用类型实体

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||引用类型ID|
|typeName|string|false|none||引用类型名称|
|typeDescription|string|false|none||引用类型描述|
|isActive|integer(int32)|false|none||是否启用(1:启用 0:未启用)|

<h2 id="tocS_PageTag">PageTag</h2>

<a id="schemapagetag"></a>
<a id="schema_PageTag"></a>
<a id="tocSpagetag"></a>
<a id="tocspagetag"></a>

```json
{
  "records": [
    {
      "id": 0,
      "tagName": "string",
      "tagDescription": "string",
      "sectionId": 0,
      "creationTime": "2019-08-24T14:15:22Z",
      "updateTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "tagName": "string",
        "tagDescription": "string",
        "sectionId": 0,
        "creationTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "tagName": "string",
          "tagDescription": "string",
          "sectionId": 0,
          "creationTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "tagName": "string",
          "tagDescription": "string",
          "sectionId": 0,
          "creationTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "tagName": "string",
        "tagDescription": "string",
        "sectionId": 0,
        "creationTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "tagName": "string",
          "tagDescription": "string",
          "sectionId": 0,
          "creationTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "tagName": "string",
          "tagDescription": "string",
          "sectionId": 0,
          "creationTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[Tag](#schematag)]|false|none||[标签实体类]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageTag](#schemapagetag)|false|none||none|
|searchCount|[PageTag](#schemapagetag)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespCitationType">RespCitationType</h2>

<a id="schemarespcitationtype"></a>
<a id="schema_RespCitationType"></a>
<a id="tocSrespcitationtype"></a>
<a id="tocsrespcitationtype"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "typeName": "string",
    "typeDescription": "string",
    "isActive": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[CitationType](#schemacitationtype)|false|none||引用类型实体|

<h2 id="tocS_RespPageTag">RespPageTag</h2>

<a id="schemaresppagetag"></a>
<a id="schema_RespPageTag"></a>
<a id="tocSresppagetag"></a>
<a id="tocsresppagetag"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "tagName": "string",
        "tagDescription": "string",
        "sectionId": 0,
        "creationTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "tagName": "string",
          "tagDescription": "string",
          "sectionId": 0,
          "creationTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "tagName": "string",
          "tagDescription": "string",
          "sectionId": 0,
          "creationTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageTag](#schemapagetag)|false|none||none|

<h2 id="tocS_Notification对象">Notification对象</h2>

<a id="schemanotification对象"></a>
<a id="schema_Notification对象"></a>
<a id="tocSnotification对象"></a>
<a id="tocsnotification对象"></a>

```json
{
  "id": 0,
  "userSenderId": 0,
  "userReceiverId": 0,
  "title": "string",
  "content": "string",
  "type": 0,
  "status": 0,
  "creationTime": "2019-08-24T14:15:22Z",
  "readTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0
}

```

通知信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||主键ID|
|userSenderId|integer(int64)|false|none||发送者ID|
|userReceiverId|integer(int64)|false|none||接收者ID|
|title|string|false|none||通知标题|
|content|string|false|none||通知内容|
|type|integer(int32)|false|none||通知类型(1:评论回复 2:点赞 3:系统通知)|
|status|integer(int32)|false|none||通知状态(0:未读 1:已读)|
|creationTime|string(date-time)|false|none||创建时间|
|readTime|string(date-time)|false|none||阅读时间|
|isDeleted|integer(int32)|false|none||是否删除(1:是 0:否)|

<h2 id="tocS_ReviewLog对象">ReviewLog对象</h2>

<a id="schemareviewlog对象"></a>
<a id="schema_ReviewLog对象"></a>
<a id="tocSreviewlog对象"></a>
<a id="tocsreviewlog对象"></a>

```json
{
  "id": 0,
  "contentId": 0,
  "contentType": 0,
  "reviewerId": 0,
  "reviewStatus": 0,
  "reviewTime": "2019-08-24T14:15:22Z",
  "reviewNotes": "string"
}

```

审核日志信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||主键ID|
|contentId|integer(int64)|false|none||被审核内容ID|
|contentType|integer(int32)|false|none||被审核内容类型(0:用户 1:帖子 2:合集 3:收藏夹)|
|reviewerId|integer(int64)|false|none||审核人ID|
|reviewStatus|integer(int32)|false|none||审核状态(0:待审核 1:已通过 2:已拒绝)|
|reviewTime|string(date-time)|false|none||审核时间|
|reviewNotes|string|false|none||审核备注|

<h2 id="tocS_FavoriteFolderDTO">FavoriteFolderDTO</h2>

<a id="schemafavoritefolderdto"></a>
<a id="schema_FavoriteFolderDTO"></a>
<a id="tocSfavoritefolderdto"></a>
<a id="tocsfavoritefolderdto"></a>

```json
{
  "folderName": "string",
  "visibility": 0,
  "id": 0
}

```

收藏夹DTO

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|folderName|string|true|none||收藏夹名称|
|visibility|integer(int32)|false|none||可见性(0:自己可见 1:公开可见)|
|id|integer(int64)|false|none||none|

<h2 id="tocS_UpdateUserInfoDTO">UpdateUserInfoDTO</h2>

<a id="schemaupdateuserinfodto"></a>
<a id="schema_UpdateUserInfoDTO"></a>
<a id="tocSupdateuserinfodto"></a>
<a id="tocsupdateuserinfodto"></a>

```json
{
  "username": "string",
  "email": "string",
  "phoneNumber": "string",
  "gender": 0,
  "birthDate": "2019-08-24",
  "bio": "string"
}

```

更新用户信息DTO

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|username|string|false|none||用户名|
|email|string|false|none||邮箱|
|phoneNumber|string|false|none||手机号|
|gender|integer(int32)|false|none||性别（0男 1女 2其他）|
|birthDate|string(date)|false|none||出生日期|
|bio|string|false|none||个人简介|

<h2 id="tocS_CreateCollectionDTO">CreateCollectionDTO</h2>

<a id="schemacreatecollectiondto"></a>
<a id="schema_CreateCollectionDTO"></a>
<a id="tocScreatecollectiondto"></a>
<a id="tocscreatecollectiondto"></a>

```json
{
  "collectionName": "string",
  "collectionDescription": "string",
  "visibility": 0
}

```

创建合集

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|collectionName|string|true|none||合集名称|
|collectionDescription|string|false|none||合集描述|
|visibility|integer(int32)|true|none||可见性(0:私密 1:公开)|

<h2 id="tocS_Feedback对象">Feedback对象</h2>

<a id="schemafeedback对象"></a>
<a id="schema_Feedback对象"></a>
<a id="tocSfeedback对象"></a>
<a id="tocsfeedback对象"></a>

```json
{
  "id": 0,
  "userId": 0,
  "feedbackContent": "string",
  "feedbackTime": "2019-08-24T14:15:22Z",
  "status": 0,
  "isDeleted": 0
}

```

反馈信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||主键ID|
|userId|integer(int64)|false|none||用户ID|
|feedbackContent|string|false|none||反馈内容|
|feedbackTime|string(date-time)|false|none||反馈时间|
|status|integer(int32)|false|none||处理状态(0:未处理 1:已处理 2:已回复)|
|isDeleted|integer(int32)|false|none||是否删除(1:是 0:否)|

<h2 id="tocS_FollowQueryDTO">FollowQueryDTO</h2>

<a id="schemafollowquerydto"></a>
<a id="schema_FollowQueryDTO"></a>
<a id="tocSfollowquerydto"></a>
<a id="tocsfollowquerydto"></a>

```json
{
  "userId": 0,
  "type": 0,
  "pageNum": 0,
  "pageSize": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|userId|integer(int64)|false|none||none|
|type|integer(int32)|false|none||none|
|pageNum|integer(int32)|false|none||none|
|pageSize|integer(int32)|false|none||none|

<h2 id="tocS_FeedbackDTO">FeedbackDTO</h2>

<a id="schemafeedbackdto"></a>
<a id="schema_FeedbackDTO"></a>
<a id="tocSfeedbackdto"></a>
<a id="tocsfeedbackdto"></a>

```json
{
  "feedbackContent": "string"
}

```

反馈DTO

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|feedbackContent|string|true|none||反馈内容|

<h2 id="tocS_RespUserInfoVO">RespUserInfoVO</h2>

<a id="schemarespuserinfovo"></a>
<a id="schema_RespUserInfoVO"></a>
<a id="tocSrespuserinfovo"></a>
<a id="tocsrespuserinfovo"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "username": "string",
    "email": "string",
    "phoneNumber": "string",
    "registrationTime": "2019-08-24T14:15:22Z",
    "lastLoginTime": "2019-08-24T14:15:22Z",
    "lastLoginLocation": "string",
    "lastUpdatedTime": "2019-08-24T14:15:22Z",
    "isFrozen": 0,
    "permissionLevel": 0,
    "gender": 0,
    "birthDate": "2019-08-24",
    "bio": "string",
    "avatar": "string",
    "followingCount": 0,
    "followersCount": 0,
    "reviewStatus": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[UserInfoVO](#schemauserinfovo)|false|none||用户信息|

<h2 id="tocS_PageUser">PageUser</h2>

<a id="schemapageuser"></a>
<a id="schema_PageUser"></a>
<a id="tocSpageuser"></a>
<a id="tocspageuser"></a>

```json
{
  "records": [
    {
      "id": 0,
      "username": "string",
      "email": "string",
      "phoneNumber": "string",
      "registrationTime": "2019-08-24T14:15:22Z",
      "lastLoginTime": "2019-08-24T14:15:22Z",
      "lastLoginLocation": "string",
      "lastUpdatedTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0,
      "isAdmin": 0,
      "isFrozen": 0,
      "permissionLevel": 0,
      "gender": 0,
      "birthDate": "2019-08-24",
      "bio": "string",
      "avatar": "string",
      "followingCount": 0,
      "followersCount": 0,
      "reviewStatus": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "username": "string",
        "email": "string",
        "phoneNumber": "string",
        "registrationTime": "2019-08-24T14:15:22Z",
        "lastLoginTime": "2019-08-24T14:15:22Z",
        "lastLoginLocation": "string",
        "lastUpdatedTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "isAdmin": 0,
        "isFrozen": 0,
        "permissionLevel": 0,
        "gender": 0,
        "birthDate": "2019-08-24",
        "bio": "string",
        "avatar": "string",
        "followingCount": 0,
        "followersCount": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "username": "string",
          "email": "string",
          "phoneNumber": "string",
          "registrationTime": "2019-08-24T14:15:22Z",
          "lastLoginTime": "2019-08-24T14:15:22Z",
          "lastLoginLocation": "string",
          "lastUpdatedTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "isAdmin": 0,
          "isFrozen": 0,
          "permissionLevel": 0,
          "gender": 0,
          "birthDate": "2019-08-24",
          "bio": "string",
          "avatar": "string",
          "followingCount": 0,
          "followersCount": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "username": "string",
          "email": "string",
          "phoneNumber": "string",
          "registrationTime": "2019-08-24T14:15:22Z",
          "lastLoginTime": "2019-08-24T14:15:22Z",
          "lastLoginLocation": "string",
          "lastUpdatedTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "isAdmin": 0,
          "isFrozen": 0,
          "permissionLevel": 0,
          "gender": 0,
          "birthDate": "2019-08-24",
          "bio": "string",
          "avatar": "string",
          "followingCount": 0,
          "followersCount": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "username": "string",
        "email": "string",
        "phoneNumber": "string",
        "registrationTime": "2019-08-24T14:15:22Z",
        "lastLoginTime": "2019-08-24T14:15:22Z",
        "lastLoginLocation": "string",
        "lastUpdatedTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "isAdmin": 0,
        "isFrozen": 0,
        "permissionLevel": 0,
        "gender": 0,
        "birthDate": "2019-08-24",
        "bio": "string",
        "avatar": "string",
        "followingCount": 0,
        "followersCount": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "username": "string",
          "email": "string",
          "phoneNumber": "string",
          "registrationTime": "2019-08-24T14:15:22Z",
          "lastLoginTime": "2019-08-24T14:15:22Z",
          "lastLoginLocation": "string",
          "lastUpdatedTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "isAdmin": 0,
          "isFrozen": 0,
          "permissionLevel": 0,
          "gender": 0,
          "birthDate": "2019-08-24",
          "bio": "string",
          "avatar": "string",
          "followingCount": 0,
          "followersCount": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "username": "string",
          "email": "string",
          "phoneNumber": "string",
          "registrationTime": "2019-08-24T14:15:22Z",
          "lastLoginTime": "2019-08-24T14:15:22Z",
          "lastLoginLocation": "string",
          "lastUpdatedTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "isAdmin": 0,
          "isFrozen": 0,
          "permissionLevel": 0,
          "gender": 0,
          "birthDate": "2019-08-24",
          "bio": "string",
          "avatar": "string",
          "followingCount": 0,
          "followersCount": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[User](#schemauser)]|false|none||[用户信息]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageUser](#schemapageuser)|false|none||none|
|searchCount|[PageUser](#schemapageuser)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_ShareCreateDTO">ShareCreateDTO</h2>

<a id="schemasharecreatedto"></a>
<a id="schema_ShareCreateDTO"></a>
<a id="tocSsharecreatedto"></a>
<a id="tocssharecreatedto"></a>

```json
{
  "userId": 0,
  "shareObjectId": 0,
  "shareObjectType": 0
}

```

创建分享请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|userId|integer(int64)|true|none||用户ID|
|shareObjectId|integer(int64)|true|none||分享对象ID|
|shareObjectType|integer(int32)|true|none||分享对象类型(1:帖子 2:合集)|

<h2 id="tocS_CollectionCommentDTO">CollectionCommentDTO</h2>

<a id="schemacollectioncommentdto"></a>
<a id="schema_CollectionCommentDTO"></a>
<a id="tocScollectioncommentdto"></a>
<a id="tocscollectioncommentdto"></a>

```json
{
  "collectionId": 1,
  "content": "这是一条评论"
}

```

评论信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|collectionId|integer(int64)|true|none||合集ID|
|content|string|true|none||评论内容|

<h2 id="tocS_UserInfoVO">UserInfoVO</h2>

<a id="schemauserinfovo"></a>
<a id="schema_UserInfoVO"></a>
<a id="tocSuserinfovo"></a>
<a id="tocsuserinfovo"></a>

```json
{
  "id": 0,
  "username": "string",
  "email": "string",
  "phoneNumber": "string",
  "registrationTime": "2019-08-24T14:15:22Z",
  "lastLoginTime": "2019-08-24T14:15:22Z",
  "lastLoginLocation": "string",
  "lastUpdatedTime": "2019-08-24T14:15:22Z",
  "isFrozen": 0,
  "permissionLevel": 0,
  "gender": 0,
  "birthDate": "2019-08-24",
  "bio": "string",
  "avatar": "string",
  "followingCount": 0,
  "followersCount": 0,
  "reviewStatus": 0
}

```

用户信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||用户ID|
|username|string|false|none||用户名|
|email|string|false|none||邮箱|
|phoneNumber|string|false|none||手机号|
|registrationTime|string(date-time)|false|none||注册时间|
|lastLoginTime|string(date-time)|false|none||最后登录时间|
|lastLoginLocation|string|false|none||最后登录地点|
|lastUpdatedTime|string(date-time)|false|none||最后更新时间|
|isFrozen|integer(int32)|false|none||是否冻结（0否 1是）|
|permissionLevel|integer(int32)|false|none||权限等级（0正常 1禁止评论 2禁止发帖）|
|gender|integer(int32)|false|none||性别（0男 1女 2其他）|
|birthDate|string(date)|false|none||出生日期|
|bio|string|false|none||个人简介|
|avatar|string|false|none||头像URL|
|followingCount|integer(int32)|false|none||关注数|
|followersCount|integer(int32)|false|none||粉丝数|
|reviewStatus|integer(int32)|false|none||审核状态（0待审核 1已通过 2已拒绝）|

<h2 id="tocS_RespPageUser">RespPageUser</h2>

<a id="schemaresppageuser"></a>
<a id="schema_RespPageUser"></a>
<a id="tocSresppageuser"></a>
<a id="tocsresppageuser"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "username": "string",
        "email": "string",
        "phoneNumber": "string",
        "registrationTime": "2019-08-24T14:15:22Z",
        "lastLoginTime": "2019-08-24T14:15:22Z",
        "lastLoginLocation": "string",
        "lastUpdatedTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "isAdmin": 0,
        "isFrozen": 0,
        "permissionLevel": 0,
        "gender": 0,
        "birthDate": "2019-08-24",
        "bio": "string",
        "avatar": "string",
        "followingCount": 0,
        "followersCount": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "username": "string",
          "email": "string",
          "phoneNumber": "string",
          "registrationTime": "2019-08-24T14:15:22Z",
          "lastLoginTime": "2019-08-24T14:15:22Z",
          "lastLoginLocation": "string",
          "lastUpdatedTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "isAdmin": 0,
          "isFrozen": 0,
          "permissionLevel": 0,
          "gender": 0,
          "birthDate": "2019-08-24",
          "bio": "string",
          "avatar": "string",
          "followingCount": 0,
          "followersCount": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "username": "string",
          "email": "string",
          "phoneNumber": "string",
          "registrationTime": "2019-08-24T14:15:22Z",
          "lastLoginTime": "2019-08-24T14:15:22Z",
          "lastLoginLocation": "string",
          "lastUpdatedTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "isAdmin": 0,
          "isFrozen": 0,
          "permissionLevel": 0,
          "gender": 0,
          "birthDate": "2019-08-24",
          "bio": "string",
          "avatar": "string",
          "followingCount": 0,
          "followersCount": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageUser](#schemapageuser)|false|none||none|

<h2 id="tocS_RespShare">RespShare</h2>

<a id="schemarespshare"></a>
<a id="schema_RespShare"></a>
<a id="tocSrespshare"></a>
<a id="tocsrespshare"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "userId": 0,
    "shareObjectId": 0,
    "shareObjectType": 0,
    "shareLink": "string",
    "shareTime": "2019-08-24T14:15:22Z",
    "isDeleted": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[Share](#schemashare)|false|none||分享实体|

<h2 id="tocS_Share">Share</h2>

<a id="schemashare"></a>
<a id="schema_Share"></a>
<a id="tocSshare"></a>
<a id="tocsshare"></a>

```json
{
  "id": 0,
  "userId": 0,
  "shareObjectId": 0,
  "shareObjectType": 0,
  "shareLink": "string",
  "shareTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0
}

```

分享实体

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||分享ID|
|userId|integer(int64)|false|none||用户ID|
|shareObjectId|integer(int64)|false|none||分享对象ID|
|shareObjectType|integer(int32)|false|none||分享对象类型(1:帖子 2:合集)|
|shareLink|string|false|none||分享链接|
|shareTime|string(date-time)|false|none||分享时间|
|isDeleted|integer(int32)|false|none||是否删除(1:已删除 0:未删除)|

<h2 id="tocS_ShareQueryDTO">ShareQueryDTO</h2>

<a id="schemasharequerydto"></a>
<a id="schema_ShareQueryDTO"></a>
<a id="tocSsharequerydto"></a>
<a id="tocssharequerydto"></a>

```json
{
  "current": 0,
  "size": 0,
  "userId": 0,
  "shareObjectId": 0,
  "shareObjectType": 0,
  "startTime": "2019-08-24T14:15:22Z",
  "endTime": "2019-08-24T14:15:22Z"
}

```

分享查询参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|current|integer(int64)|false|none||页码|
|size|integer(int64)|false|none||每页大小|
|userId|integer(int64)|false|none||用户ID|
|shareObjectId|integer(int64)|false|none||分享对象ID|
|shareObjectType|integer(int32)|false|none||分享对象类型|
|startTime|string(date-time)|false|none||开始时间|
|endTime|string(date-time)|false|none||结束时间|

<h2 id="tocS_PageShare">PageShare</h2>

<a id="schemapageshare"></a>
<a id="schema_PageShare"></a>
<a id="tocSpageshare"></a>
<a id="tocspageshare"></a>

```json
{
  "records": [
    {
      "id": 0,
      "userId": 0,
      "shareObjectId": 0,
      "shareObjectType": 0,
      "shareLink": "string",
      "shareTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "shareObjectId": 0,
        "shareObjectType": 0,
        "shareLink": "string",
        "shareTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "shareObjectId": 0,
          "shareObjectType": 0,
          "shareLink": "string",
          "shareTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "shareObjectId": 0,
          "shareObjectType": 0,
          "shareLink": "string",
          "shareTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "shareObjectId": 0,
        "shareObjectType": 0,
        "shareLink": "string",
        "shareTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "shareObjectId": 0,
          "shareObjectType": 0,
          "shareLink": "string",
          "shareTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "shareObjectId": 0,
          "shareObjectType": 0,
          "shareLink": "string",
          "shareTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[Share](#schemashare)]|false|none||[分享实体]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageShare](#schemapageshare)|false|none||none|
|searchCount|[PageShare](#schemapageshare)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageShare">RespPageShare</h2>

<a id="schemaresppageshare"></a>
<a id="schema_RespPageShare"></a>
<a id="tocSresppageshare"></a>
<a id="tocsresppageshare"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "shareObjectId": 0,
        "shareObjectType": 0,
        "shareLink": "string",
        "shareTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "shareObjectId": 0,
          "shareObjectType": 0,
          "shareLink": "string",
          "shareTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "shareObjectId": 0,
          "shareObjectType": 0,
          "shareLink": "string",
          "shareTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageShare](#schemapageshare)|false|none||none|

<h2 id="tocS_ReportedTypeCreateDTO">ReportedTypeCreateDTO</h2>

<a id="schemareportedtypecreatedto"></a>
<a id="schema_ReportedTypeCreateDTO"></a>
<a id="tocSreportedtypecreatedto"></a>
<a id="tocsreportedtypecreatedto"></a>

```json
{
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}

```

创建举报对象类型请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|typeName|string|true|none||举报对象类型名称|
|typeDescription|string|true|none||举报对象类型描述|
|isActive|integer(int32)|true|none||是否启用(1:启用 0:未启用)|

<h2 id="tocS_ReportCreateDTO">ReportCreateDTO</h2>

<a id="schemareportcreatedto"></a>
<a id="schema_ReportCreateDTO"></a>
<a id="tocSreportcreatedto"></a>
<a id="tocsreportcreatedto"></a>

```json
{
  "userId": 0,
  "reportedContentId": 0,
  "reportedTypeId": 0,
  "reportTypeId": 0,
  "reason": "string"
}

```

创建举报请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|userId|integer(int64)|true|none||举报人ID|
|reportedContentId|integer(int64)|true|none||被举报内容ID|
|reportedTypeId|integer(int64)|true|none||举报对象类型ID|
|reportTypeId|integer(int64)|true|none||举报类型ID|
|reason|string|false|none||举报理由|

<h2 id="tocS_ReportQueryDTO">ReportQueryDTO</h2>

<a id="schemareportquerydto"></a>
<a id="schema_ReportQueryDTO"></a>
<a id="tocSreportquerydto"></a>
<a id="tocsreportquerydto"></a>

```json
{
  "current": 0,
  "size": 0,
  "userId": 0,
  "reportedTypeId": 0,
  "reportTypeId": 0,
  "status": 0,
  "startTime": "2019-08-24T14:15:22Z",
  "endTime": "2019-08-24T14:15:22Z"
}

```

举报查询参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|current|integer(int64)|false|none||页码|
|size|integer(int64)|false|none||每页大小|
|userId|integer(int64)|false|none||举报用户ID|
|reportedTypeId|integer(int64)|false|none||举报对象类型ID|
|reportTypeId|integer(int64)|false|none||举报类型ID|
|status|integer(int32)|false|none||处理状态|
|startTime|string(date-time)|false|none||开始时间|
|endTime|string(date-time)|false|none||结束时间|

<h2 id="tocS_PageReport">PageReport</h2>

<a id="schemapagereport"></a>
<a id="schema_PageReport"></a>
<a id="tocSpagereport"></a>
<a id="tocspagereport"></a>

```json
{
  "records": [
    {
      "id": 0,
      "userId": 0,
      "reportedContentId": 0,
      "reportedTypeId": 0,
      "reportTypeId": 0,
      "reason": "string",
      "reportTime": "2019-08-24T14:15:22Z",
      "status": 0,
      "outcome": 0,
      "isDeleted": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "reportedContentId": 0,
        "reportedTypeId": 0,
        "reportTypeId": 0,
        "reason": "string",
        "reportTime": "2019-08-24T14:15:22Z",
        "status": 0,
        "outcome": 0,
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "reportedContentId": 0,
          "reportedTypeId": 0,
          "reportTypeId": 0,
          "reason": "string",
          "reportTime": "2019-08-24T14:15:22Z",
          "status": 0,
          "outcome": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "reportedContentId": 0,
          "reportedTypeId": 0,
          "reportTypeId": 0,
          "reason": "string",
          "reportTime": "2019-08-24T14:15:22Z",
          "status": 0,
          "outcome": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "reportedContentId": 0,
        "reportedTypeId": 0,
        "reportTypeId": 0,
        "reason": "string",
        "reportTime": "2019-08-24T14:15:22Z",
        "status": 0,
        "outcome": 0,
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "reportedContentId": 0,
          "reportedTypeId": 0,
          "reportTypeId": 0,
          "reason": "string",
          "reportTime": "2019-08-24T14:15:22Z",
          "status": 0,
          "outcome": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "reportedContentId": 0,
          "reportedTypeId": 0,
          "reportTypeId": 0,
          "reason": "string",
          "reportTime": "2019-08-24T14:15:22Z",
          "status": 0,
          "outcome": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[Report](#schemareport)]|false|none||[举报实体]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageReport](#schemapagereport)|false|none||none|
|searchCount|[PageReport](#schemapagereport)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageReport">RespPageReport</h2>

<a id="schemaresppagereport"></a>
<a id="schema_RespPageReport"></a>
<a id="tocSresppagereport"></a>
<a id="tocsresppagereport"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "reportedContentId": 0,
        "reportedTypeId": 0,
        "reportTypeId": 0,
        "reason": "string",
        "reportTime": "2019-08-24T14:15:22Z",
        "status": 0,
        "outcome": 0,
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "reportedContentId": 0,
          "reportedTypeId": 0,
          "reportTypeId": 0,
          "reason": "string",
          "reportTime": "2019-08-24T14:15:22Z",
          "status": 0,
          "outcome": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "reportedContentId": 0,
          "reportedTypeId": 0,
          "reportTypeId": 0,
          "reason": "string",
          "reportTime": "2019-08-24T14:15:22Z",
          "status": 0,
          "outcome": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageReport](#schemapagereport)|false|none||none|

<h2 id="tocS_ReportTypeCreateDTO">ReportTypeCreateDTO</h2>

<a id="schemareporttypecreatedto"></a>
<a id="schema_ReportTypeCreateDTO"></a>
<a id="tocSreporttypecreatedto"></a>
<a id="tocsreporttypecreatedto"></a>

```json
{
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}

```

创建举报类型请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|typeName|string|true|none||举报类型名称|
|typeDescription|string|true|none||举报类型描述|
|isActive|integer(int32)|true|none||是否启用(1:启用 0:未启用)|

<h2 id="tocS_PostCitationsCreateDTO">PostCitationsCreateDTO</h2>

<a id="schemapostcitationscreatedto"></a>
<a id="schema_PostCitationsCreateDTO"></a>
<a id="tocSpostcitationscreatedto"></a>
<a id="tocspostcitationscreatedto"></a>

```json
{
  "citationPostId": 0,
  "postCitationId": 0
}

```

创建帖子引用关联请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|citationPostId|integer(int64)|true|none||引用帖子ID|
|postCitationId|integer(int64)|true|none||被引用帖子ID|

<h2 id="tocS_PostCitations">PostCitations</h2>

<a id="schemapostcitations"></a>
<a id="schema_PostCitations"></a>
<a id="tocSpostcitations"></a>
<a id="tocspostcitations"></a>

```json
{
  "id": 0,
  "citationPostId": 0,
  "postCitationId": 0,
  "isDeleted": 0
}

```

帖子引用关联实体

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||主键ID|
|citationPostId|integer(int64)|false|none||引用帖子ID|
|postCitationId|integer(int64)|false|none||被引用帖子ID|
|isDeleted|integer(int32)|false|none||是否删除(1:已删除 0:未删除)|

<h2 id="tocS_RespPostCitations">RespPostCitations</h2>

<a id="schemaresppostcitations"></a>
<a id="schema_RespPostCitations"></a>
<a id="tocSresppostcitations"></a>
<a id="tocsresppostcitations"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "citationPostId": 0,
    "postCitationId": 0,
    "isDeleted": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PostCitations](#schemapostcitations)|false|none||帖子引用关联实体|

<h2 id="tocS_PostCitationsQueryDTO">PostCitationsQueryDTO</h2>

<a id="schemapostcitationsquerydto"></a>
<a id="schema_PostCitationsQueryDTO"></a>
<a id="tocSpostcitationsquerydto"></a>
<a id="tocspostcitationsquerydto"></a>

```json
{
  "current": 0,
  "size": 0,
  "citationPostId": 0,
  "postCitationId": 0
}

```

帖子引用关联查询参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|current|integer(int64)|false|none||页码|
|size|integer(int64)|false|none||每页大小|
|citationPostId|integer(int64)|false|none||引用帖子ID|
|postCitationId|integer(int64)|false|none||被引用帖子ID|

<h2 id="tocS_PagePostCitations">PagePostCitations</h2>

<a id="schemapagepostcitations"></a>
<a id="schema_PagePostCitations"></a>
<a id="tocSpagepostcitations"></a>
<a id="tocspagepostcitations"></a>

```json
{
  "records": [
    {
      "id": 0,
      "citationPostId": 0,
      "postCitationId": 0,
      "isDeleted": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "citationPostId": 0,
        "postCitationId": 0,
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "citationPostId": 0,
          "postCitationId": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "citationPostId": 0,
          "postCitationId": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "citationPostId": 0,
        "postCitationId": 0,
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "citationPostId": 0,
          "postCitationId": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "citationPostId": 0,
          "postCitationId": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[PostCitations](#schemapostcitations)]|false|none||[帖子引用关联实体]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PagePostCitations](#schemapagepostcitations)|false|none||none|
|searchCount|[PagePostCitations](#schemapagepostcitations)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPagePostCitations">RespPagePostCitations</h2>

<a id="schemaresppagepostcitations"></a>
<a id="schema_RespPagePostCitations"></a>
<a id="tocSresppagepostcitations"></a>
<a id="tocsresppagepostcitations"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "citationPostId": 0,
        "postCitationId": 0,
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "citationPostId": 0,
          "postCitationId": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "citationPostId": 0,
          "postCitationId": 0,
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PagePostCitations](#schemapagepostcitations)|false|none||none|

<h2 id="tocS_CommentCreateDTO">CommentCreateDTO</h2>

<a id="schemacommentcreatedto"></a>
<a id="schema_CommentCreateDTO"></a>
<a id="tocScommentcreatedto"></a>
<a id="tocscommentcreatedto"></a>

```json
{
  "commenterId": 0,
  "commentableId": 0,
  "commentableType": 0,
  "content": "string",
  "parentCommentId": 0,
  "isPublic": 0
}

```

创建评论请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|commenterId|integer(int64)|true|none||评论者ID|
|commentableId|integer(int64)|true|none||被评论对象ID|
|commentableType|integer(int32)|true|none||被评论对象类型(1:帖子 2:合集 3:评论)|
|content|string|true|none||评论内容|
|parentCommentId|integer(int64)|false|none||父评论ID|
|isPublic|integer(int32)|true|none||是否公开(0:私密 1:公开)|

<h2 id="tocS_Comment">Comment</h2>

<a id="schemacomment"></a>
<a id="schema_Comment"></a>
<a id="tocScomment"></a>
<a id="tocscomment"></a>

```json
{
  "id": 0,
  "commenterId": 0,
  "commentableId": 0,
  "commentableType": 0,
  "content": "string",
  "creationTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0,
  "parentCommentId": 0,
  "likeCount": 0,
  "replyCount": 0,
  "isPublic": 0,
  "reviewStatus": 0
}

```

评论实体

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||评论ID|
|commenterId|integer(int64)|false|none||评论者ID|
|commentableId|integer(int64)|false|none||被评论对象ID|
|commentableType|integer(int32)|false|none||被评论对象类型(1:帖子 2:合集 3:评论)|
|content|string|false|none||评论内容|
|creationTime|string(date-time)|false|none||创建时间|
|isDeleted|integer(int32)|false|none||是否删除(1:已删除 0:未删除)|
|parentCommentId|integer(int64)|false|none||父评论ID|
|likeCount|integer(int32)|false|none||点赞数|
|replyCount|integer(int32)|false|none||回复数|
|isPublic|integer(int32)|false|none||是否公开(0:私密 1:公开)|
|reviewStatus|integer(int32)|false|none||审核状态(0:待审核 1:已通过 2:已拒绝)|

<h2 id="tocS_RespComment">RespComment</h2>

<a id="schemarespcomment"></a>
<a id="schema_RespComment"></a>
<a id="tocSrespcomment"></a>
<a id="tocsrespcomment"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "commenterId": 0,
    "commentableId": 0,
    "commentableType": 0,
    "content": "string",
    "creationTime": "2019-08-24T14:15:22Z",
    "isDeleted": 0,
    "parentCommentId": 0,
    "likeCount": 0,
    "replyCount": 0,
    "isPublic": 0,
    "reviewStatus": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[Comment](#schemacomment)|false|none||评论实体|

<h2 id="tocS_CommentQueryDTO">CommentQueryDTO</h2>

<a id="schemacommentquerydto"></a>
<a id="schema_CommentQueryDTO"></a>
<a id="tocScommentquerydto"></a>
<a id="tocscommentquerydto"></a>

```json
{
  "current": 0,
  "size": 0,
  "commenterId": 0,
  "commentableId": 0,
  "commentableType": 0,
  "parentCommentId": 0,
  "reviewStatus": 0,
  "startTime": "2019-08-24T14:15:22Z",
  "endTime": "2019-08-24T14:15:22Z"
}

```

评论查询参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|current|integer(int64)|false|none||页码|
|size|integer(int64)|false|none||每页大小|
|commenterId|integer(int64)|false|none||评论者ID|
|commentableId|integer(int64)|false|none||被评论对象ID|
|commentableType|integer(int32)|false|none||被评论对象类型|
|parentCommentId|integer(int64)|false|none||父评论ID|
|reviewStatus|integer(int32)|false|none||审核状态|
|startTime|string(date-time)|false|none||开始时间|
|endTime|string(date-time)|false|none||结束时间|

<h2 id="tocS_PageComment">PageComment</h2>

<a id="schemapagecomment"></a>
<a id="schema_PageComment"></a>
<a id="tocSpagecomment"></a>
<a id="tocspagecomment"></a>

```json
{
  "records": [
    {
      "id": 0,
      "commenterId": 0,
      "commentableId": 0,
      "commentableType": 0,
      "content": "string",
      "creationTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0,
      "parentCommentId": 0,
      "likeCount": 0,
      "replyCount": 0,
      "isPublic": 0,
      "reviewStatus": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "commenterId": 0,
        "commentableId": 0,
        "commentableType": 0,
        "content": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "parentCommentId": 0,
        "likeCount": 0,
        "replyCount": 0,
        "isPublic": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "commenterId": 0,
          "commentableId": 0,
          "commentableType": 0,
          "content": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "parentCommentId": 0,
          "likeCount": 0,
          "replyCount": 0,
          "isPublic": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "commenterId": 0,
          "commentableId": 0,
          "commentableType": 0,
          "content": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "parentCommentId": 0,
          "likeCount": 0,
          "replyCount": 0,
          "isPublic": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "commenterId": 0,
        "commentableId": 0,
        "commentableType": 0,
        "content": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "parentCommentId": 0,
        "likeCount": 0,
        "replyCount": 0,
        "isPublic": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "commenterId": 0,
          "commentableId": 0,
          "commentableType": 0,
          "content": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "parentCommentId": 0,
          "likeCount": 0,
          "replyCount": 0,
          "isPublic": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "commenterId": 0,
          "commentableId": 0,
          "commentableType": 0,
          "content": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "parentCommentId": 0,
          "likeCount": 0,
          "replyCount": 0,
          "isPublic": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[Comment](#schemacomment)]|false|none||[评论实体]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageComment](#schemapagecomment)|false|none||none|
|searchCount|[PageComment](#schemapagecomment)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageComment">RespPageComment</h2>

<a id="schemaresppagecomment"></a>
<a id="schema_RespPageComment"></a>
<a id="tocSresppagecomment"></a>
<a id="tocsresppagecomment"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "commenterId": 0,
        "commentableId": 0,
        "commentableType": 0,
        "content": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "parentCommentId": 0,
        "likeCount": 0,
        "replyCount": 0,
        "isPublic": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "commenterId": 0,
          "commentableId": 0,
          "commentableType": 0,
          "content": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "parentCommentId": 0,
          "likeCount": 0,
          "replyCount": 0,
          "isPublic": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "commenterId": 0,
          "commentableId": 0,
          "commentableType": 0,
          "content": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "parentCommentId": 0,
          "likeCount": 0,
          "replyCount": 0,
          "isPublic": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageComment](#schemapagecomment)|false|none||none|

<h2 id="tocS_CollectionCreateDTO">CollectionCreateDTO</h2>

<a id="schemacollectioncreatedto"></a>
<a id="schema_CollectionCreateDTO"></a>
<a id="tocScollectioncreatedto"></a>
<a id="tocscollectioncreatedto"></a>

```json
{
  "collectionName": "string",
  "collectionDescription": "string",
  "creatorId": 0,
  "visibility": 0
}

```

创建合集请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|collectionName|string|true|none||合集名称|
|collectionDescription|string|false|none||合集描述|
|creatorId|integer(int64)|true|none||创建者ID|
|visibility|integer(int32)|true|none||可见性(0:私密 1:公开)|

<h2 id="tocS_CollectionQueryDTO">CollectionQueryDTO</h2>

<a id="schemacollectionquerydto"></a>
<a id="schema_CollectionQueryDTO"></a>
<a id="tocScollectionquerydto"></a>
<a id="tocscollectionquerydto"></a>

```json
{
  "current": 0,
  "size": 0,
  "collectionName": "string",
  "creatorId": 0,
  "visibility": 0,
  "reviewStatus": 0,
  "startTime": "2019-08-24T14:15:22Z",
  "endTime": "2019-08-24T14:15:22Z"
}

```

合集查询参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|current|integer(int64)|false|none||页码|
|size|integer(int64)|false|none||每页大小|
|collectionName|string|false|none||合集名称|
|creatorId|integer(int64)|false|none||创建者ID|
|visibility|integer(int32)|false|none||可见性|
|reviewStatus|integer(int32)|false|none||审核状态|
|startTime|string(date-time)|false|none||开始时间|
|endTime|string(date-time)|false|none||结束时间|

<h2 id="tocS_PageCollection">PageCollection</h2>

<a id="schemapagecollection"></a>
<a id="schema_PageCollection"></a>
<a id="tocSpagecollection"></a>
<a id="tocspagecollection"></a>

```json
{
  "records": [
    {
      "id": 0,
      "collectionName": "string",
      "collectionDescription": "string",
      "creatorId": 0,
      "creationTime": "2019-08-24T14:15:22Z",
      "updateTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0,
      "likeCount": 0,
      "commentCount": 0,
      "subscribeCount": 0,
      "shareCount": 0,
      "visibility": 0,
      "reviewStatus": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "collectionName": "string",
        "collectionDescription": "string",
        "creatorId": 0,
        "creationTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "likeCount": 0,
        "commentCount": 0,
        "subscribeCount": 0,
        "shareCount": 0,
        "visibility": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "collectionName": "string",
          "collectionDescription": "string",
          "creatorId": 0,
          "creationTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "likeCount": 0,
          "commentCount": 0,
          "subscribeCount": 0,
          "shareCount": 0,
          "visibility": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "collectionName": "string",
          "collectionDescription": "string",
          "creatorId": 0,
          "creationTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "likeCount": 0,
          "commentCount": 0,
          "subscribeCount": 0,
          "shareCount": 0,
          "visibility": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "collectionName": "string",
        "collectionDescription": "string",
        "creatorId": 0,
        "creationTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "likeCount": 0,
        "commentCount": 0,
        "subscribeCount": 0,
        "shareCount": 0,
        "visibility": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "collectionName": "string",
          "collectionDescription": "string",
          "creatorId": 0,
          "creationTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "likeCount": 0,
          "commentCount": 0,
          "subscribeCount": 0,
          "shareCount": 0,
          "visibility": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "collectionName": "string",
          "collectionDescription": "string",
          "creatorId": 0,
          "creationTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "likeCount": 0,
          "commentCount": 0,
          "subscribeCount": 0,
          "shareCount": 0,
          "visibility": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[Collection](#schemacollection)]|false|none||[合集实体]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageCollection](#schemapagecollection)|false|none||none|
|searchCount|[PageCollection](#schemapagecollection)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageCollection">RespPageCollection</h2>

<a id="schemaresppagecollection"></a>
<a id="schema_RespPageCollection"></a>
<a id="tocSresppagecollection"></a>
<a id="tocsresppagecollection"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "collectionName": "string",
        "collectionDescription": "string",
        "creatorId": 0,
        "creationTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "likeCount": 0,
        "commentCount": 0,
        "subscribeCount": 0,
        "shareCount": 0,
        "visibility": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "collectionName": "string",
          "collectionDescription": "string",
          "creatorId": 0,
          "creationTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "likeCount": 0,
          "commentCount": 0,
          "subscribeCount": 0,
          "shareCount": 0,
          "visibility": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "collectionName": "string",
          "collectionDescription": "string",
          "creatorId": 0,
          "creationTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0,
          "likeCount": 0,
          "commentCount": 0,
          "subscribeCount": 0,
          "shareCount": 0,
          "visibility": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageCollection](#schemapagecollection)|false|none||none|

<h2 id="tocS_CollectionSubscriptionsCreateDTO">CollectionSubscriptionsCreateDTO</h2>

<a id="schemacollectionsubscriptionscreatedto"></a>
<a id="schema_CollectionSubscriptionsCreateDTO"></a>
<a id="tocScollectionsubscriptionscreatedto"></a>
<a id="tocscollectionsubscriptionscreatedto"></a>

```json
{
  "usersId": 0,
  "collectionsId": 0
}

```

创建合集订阅请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|usersId|integer(int64)|true|none||用户ID|
|collectionsId|integer(int64)|true|none||合集ID|

<h2 id="tocS_CollectionSubscriptions">CollectionSubscriptions</h2>

<a id="schemacollectionsubscriptions"></a>
<a id="schema_CollectionSubscriptions"></a>
<a id="tocScollectionsubscriptions"></a>
<a id="tocscollectionsubscriptions"></a>

```json
{
  "id": 0,
  "usersId": 0,
  "collectionsId": 0,
  "isDeleted": 0,
  "subscriptionTime": "2019-08-24T14:15:22Z"
}

```

合集订阅实体

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||订阅ID|
|usersId|integer(int64)|false|none||用户ID|
|collectionsId|integer(int64)|false|none||合集ID|
|isDeleted|integer(int32)|false|none||是否删除(1:已删除 0:未删除)|
|subscriptionTime|string(date-time)|false|none||订阅时间|

<h2 id="tocS_RespCollectionSubscriptions">RespCollectionSubscriptions</h2>

<a id="schemarespcollectionsubscriptions"></a>
<a id="schema_RespCollectionSubscriptions"></a>
<a id="tocSrespcollectionsubscriptions"></a>
<a id="tocsrespcollectionsubscriptions"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "usersId": 0,
    "collectionsId": 0,
    "isDeleted": 0,
    "subscriptionTime": "2019-08-24T14:15:22Z"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[CollectionSubscriptions](#schemacollectionsubscriptions)|false|none||合集订阅实体|

<h2 id="tocS_CollectionSubscriptionsQueryDTO">CollectionSubscriptionsQueryDTO</h2>

<a id="schemacollectionsubscriptionsquerydto"></a>
<a id="schema_CollectionSubscriptionsQueryDTO"></a>
<a id="tocScollectionsubscriptionsquerydto"></a>
<a id="tocscollectionsubscriptionsquerydto"></a>

```json
{
  "current": 0,
  "size": 0,
  "usersId": 0,
  "collectionsId": 0,
  "startTime": "2019-08-24T14:15:22Z",
  "endTime": "2019-08-24T14:15:22Z"
}

```

合集订阅查询参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|current|integer(int64)|false|none||页码|
|size|integer(int64)|false|none||每页大小|
|usersId|integer(int64)|false|none||用户ID|
|collectionsId|integer(int64)|false|none||合集ID|
|startTime|string(date-time)|false|none||开始时间|
|endTime|string(date-time)|false|none||结束时间|

<h2 id="tocS_PageCollectionSubscriptions">PageCollectionSubscriptions</h2>

<a id="schemapagecollectionsubscriptions"></a>
<a id="schema_PageCollectionSubscriptions"></a>
<a id="tocSpagecollectionsubscriptions"></a>
<a id="tocspagecollectionsubscriptions"></a>

```json
{
  "records": [
    {
      "id": 0,
      "usersId": 0,
      "collectionsId": 0,
      "isDeleted": 0,
      "subscriptionTime": "2019-08-24T14:15:22Z"
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "usersId": 0,
        "collectionsId": 0,
        "isDeleted": 0,
        "subscriptionTime": "2019-08-24T14:15:22Z"
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "usersId": 0,
          "collectionsId": 0,
          "isDeleted": 0,
          "subscriptionTime": "2019-08-24T14:15:22Z"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "usersId": 0,
          "collectionsId": 0,
          "isDeleted": 0,
          "subscriptionTime": "2019-08-24T14:15:22Z"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "usersId": 0,
        "collectionsId": 0,
        "isDeleted": 0,
        "subscriptionTime": "2019-08-24T14:15:22Z"
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "usersId": 0,
          "collectionsId": 0,
          "isDeleted": 0,
          "subscriptionTime": "2019-08-24T14:15:22Z"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "usersId": 0,
          "collectionsId": 0,
          "isDeleted": 0,
          "subscriptionTime": "2019-08-24T14:15:22Z"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[CollectionSubscriptions](#schemacollectionsubscriptions)]|false|none||[合集订阅实体]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageCollectionSubscriptions](#schemapagecollectionsubscriptions)|false|none||none|
|searchCount|[PageCollectionSubscriptions](#schemapagecollectionsubscriptions)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageCollectionSubscriptions">RespPageCollectionSubscriptions</h2>

<a id="schemaresppagecollectionsubscriptions"></a>
<a id="schema_RespPageCollectionSubscriptions"></a>
<a id="tocSresppagecollectionsubscriptions"></a>
<a id="tocsresppagecollectionsubscriptions"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "usersId": 0,
        "collectionsId": 0,
        "isDeleted": 0,
        "subscriptionTime": "2019-08-24T14:15:22Z"
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "usersId": 0,
          "collectionsId": 0,
          "isDeleted": 0,
          "subscriptionTime": "2019-08-24T14:15:22Z"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "usersId": 0,
          "collectionsId": 0,
          "isDeleted": 0,
          "subscriptionTime": "2019-08-24T14:15:22Z"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageCollectionSubscriptions](#schemapagecollectionsubscriptions)|false|none||none|

<h2 id="tocS_CitationCreateDTO">CitationCreateDTO</h2>

<a id="schemacitationcreatedto"></a>
<a id="schema_CitationCreateDTO"></a>
<a id="tocScitationcreatedto"></a>
<a id="tocscitationcreatedto"></a>

```json
{
  "postId": 0,
  "citationTypeId": 0,
  "citationContent": "string",
  "source": "string"
}

```

创建引用请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|postId|integer(int64)|true|none||帖子ID|
|citationTypeId|integer(int64)|true|none||引用类型ID|
|citationContent|string|true|none||引用内容|
|source|string|true|none||引用来源|

<h2 id="tocS_CitationDTO">CitationDTO</h2>

<a id="schemacitationdto"></a>
<a id="schema_CitationDTO"></a>
<a id="tocScitationdto"></a>
<a id="tocscitationdto"></a>

```json
{
  "citationTypeId": 0,
  "citationContent": "string",
  "source": "string"
}

```

引用信息DTO

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|citationTypeId|integer(int64)|true|none||引用类型ID|
|citationContent|string|true|none||引用内容|
|source|string|true|none||引用来源|

<h2 id="tocS_CitationQueryDTO">CitationQueryDTO</h2>

<a id="schemacitationquerydto"></a>
<a id="schema_CitationQueryDTO"></a>
<a id="tocScitationquerydto"></a>
<a id="tocscitationquerydto"></a>

```json
{
  "current": 0,
  "size": 0,
  "postId": 0,
  "citationTypeId": 0,
  "startTime": "2019-08-24T14:15:22Z",
  "endTime": "2019-08-24T14:15:22Z"
}

```

引用查询参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|current|integer(int64)|false|none||页码|
|size|integer(int64)|false|none||每页大小|
|postId|integer(int64)|false|none||帖子ID|
|citationTypeId|integer(int64)|false|none||引用类型ID|
|startTime|string(date-time)|false|none||开始时间|
|endTime|string(date-time)|false|none||结束时间|

<h2 id="tocS_PostPublishDTO">PostPublishDTO</h2>

<a id="schemapostpublishdto"></a>
<a id="schema_PostPublishDTO"></a>
<a id="tocSpostpublishdto"></a>
<a id="tocspostpublishdto"></a>

```json
{
  "title": "string",
  "cover": "string",
  "summary": "string",
  "contentFileId": "string",
  "contentFilePath": "string",
  "sectionId": 0,
  "tags": "string",
  "collectionId": 0,
  "hasCitation": 0,
  "visibility": 0,
  "citation": {
    "citationTypeId": 0,
    "citationContent": "string",
    "source": "string"
  }
}

```

帖子发布DTO

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|title|string|false|none||帖子标题|
|cover|string|false|none||封面|
|summary|string|false|none||帖子内容的简短描述，用于快速预览|
|contentFileId|string|false|none||内容文件ID，由文件上传接口返回|
|contentFilePath|string|false|none||内容文件路径，由文件上传接口返回|
|sectionId|integer(int64)|false|none||分区ID|
|tags|string|false|none||帖子的标签，用于分类和搜索，可以是多个标签的字符串，例如 "标签1, 标签2"|
|collectionId|integer(int64)|false|none||所属合集ID|
|hasCitation|integer(int32)|false|none||是否包含引用(0:否 1:是)|
|visibility|integer(int32)|false|none||可见性(0:私密 1:公开 )|
|citation|[CitationDTO](#schemacitationdto)|false|none||引用信息DTO|

<h2 id="tocS_StatisticsRequest">StatisticsRequest</h2>

<a id="schemastatisticsrequest"></a>
<a id="schema_StatisticsRequest"></a>
<a id="tocSstatisticsrequest"></a>
<a id="tocsstatisticsrequest"></a>

```json
{
  "field": "string",
  "timeScale": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|field|string|true|none||none|
|timeScale|string|true|none||none|

<h2 id="tocS_PageCitation">PageCitation</h2>

<a id="schemapagecitation"></a>
<a id="schema_PageCitation"></a>
<a id="tocSpagecitation"></a>
<a id="tocspagecitation"></a>

```json
{
  "records": [
    {
      "id": 0,
      "postId": 0,
      "citationTypeId": 0,
      "citationContent": "string",
      "source": "string",
      "citationTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "postId": 0,
        "citationTypeId": 0,
        "citationContent": "string",
        "source": "string",
        "citationTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "postId": 0,
          "citationTypeId": 0,
          "citationContent": "string",
          "source": "string",
          "citationTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "postId": 0,
          "citationTypeId": 0,
          "citationContent": "string",
          "source": "string",
          "citationTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "postId": 0,
        "citationTypeId": 0,
        "citationContent": "string",
        "source": "string",
        "citationTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "postId": 0,
          "citationTypeId": 0,
          "citationContent": "string",
          "source": "string",
          "citationTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "postId": 0,
          "citationTypeId": 0,
          "citationContent": "string",
          "source": "string",
          "citationTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[Citation](#schemacitation)]|false|none||[引用实体]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageCitation](#schemapagecitation)|false|none||none|
|searchCount|[PageCitation](#schemapagecitation)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespStatisticsResponse">RespStatisticsResponse</h2>

<a id="schemarespstatisticsresponse"></a>
<a id="schema_RespStatisticsResponse"></a>
<a id="tocSrespstatisticsresponse"></a>
<a id="tocsrespstatisticsresponse"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "totalCount": 0,
    "incrementalCount": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[StatisticsResponse](#schemastatisticsresponse)|false|none||none|

<h2 id="tocS_RespPageCitation">RespPageCitation</h2>

<a id="schemaresppagecitation"></a>
<a id="schema_RespPageCitation"></a>
<a id="tocSresppagecitation"></a>
<a id="tocsresppagecitation"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "postId": 0,
        "citationTypeId": 0,
        "citationContent": "string",
        "source": "string",
        "citationTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "postId": 0,
          "citationTypeId": 0,
          "citationContent": "string",
          "source": "string",
          "citationTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "postId": 0,
          "citationTypeId": 0,
          "citationContent": "string",
          "source": "string",
          "citationTime": "2019-08-24T14:15:22Z",
          "isDeleted": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageCitation](#schemapagecitation)|false|none||none|

<h2 id="tocS_CommentDTO">CommentDTO</h2>

<a id="schemacommentdto"></a>
<a id="schema_CommentDTO"></a>
<a id="tocScommentdto"></a>
<a id="tocscommentdto"></a>

```json
{
  "id": 0,
  "content": "string",
  "commenterId": 0,
  "commenterName": "string",
  "commenterAvatar": "string",
  "creationTime": "2019-08-24T14:15:22Z",
  "likeCount": 0,
  "isLiked": true,
  "replyCount": 0,
  "parentCommentId": 0,
  "replyToCommenterId": 0,
  "replyToCommenterName": "string",
  "isPublic": 0,
  "reviewStatus": 0
}

```

评论信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||评论ID|
|content|string|false|none||评论内容|
|commenterId|integer(int64)|false|none||评论者ID|
|commenterName|string|false|none||评论者名称|
|commenterAvatar|string|false|none||评论者头像|
|creationTime|string(date-time)|false|none||评论时间|
|likeCount|integer(int32)|false|none||点赞数|
|isLiked|boolean|false|none||是否已点赞|
|replyCount|integer(int32)|false|none||回复数|
|parentCommentId|integer(int64)|false|none||父评论ID|
|replyToCommenterId|integer(int64)|false|none||被回复者ID|
|replyToCommenterName|string|false|none||被回复者名称|
|isPublic|integer(int32)|false|none||是否公开|
|reviewStatus|integer(int32)|false|none||审核状态|

<h2 id="tocS_StatisticsResponse">StatisticsResponse</h2>

<a id="schemastatisticsresponse"></a>
<a id="schema_StatisticsResponse"></a>
<a id="tocSstatisticsresponse"></a>
<a id="tocsstatisticsresponse"></a>

```json
{
  "totalCount": 0,
  "incrementalCount": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|totalCount|integer(int64)|false|none||none|
|incrementalCount|integer(int64)|false|none||none|

<h2 id="tocS_CitationTypeCreateDTO">CitationTypeCreateDTO</h2>

<a id="schemacitationtypecreatedto"></a>
<a id="schema_CitationTypeCreateDTO"></a>
<a id="tocScitationtypecreatedto"></a>
<a id="tocscitationtypecreatedto"></a>

```json
{
  "typeName": "string",
  "typeDescription": "string",
  "isActive": 0
}

```

创建引用类型请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|typeName|string|true|none||引用类型名称|
|typeDescription|string|false|none||引用类型描述|
|isActive|integer(int32)|true|none||是否启用(1:启用 0:未启用)|

<h2 id="tocS_RespCommentDTO">RespCommentDTO</h2>

<a id="schemarespcommentdto"></a>
<a id="schema_RespCommentDTO"></a>
<a id="tocSrespcommentdto"></a>
<a id="tocsrespcommentdto"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "content": "string",
    "commenterId": 0,
    "commenterName": "string",
    "commenterAvatar": "string",
    "creationTime": "2019-08-24T14:15:22Z",
    "likeCount": 0,
    "isLiked": true,
    "replyCount": 0,
    "parentCommentId": 0,
    "replyToCommenterId": 0,
    "replyToCommenterName": "string",
    "isPublic": 0,
    "reviewStatus": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[CommentDTO](#schemacommentdto)|false|none||评论信息|

<h2 id="tocS_RespFavoriteFolder对象">RespFavoriteFolder对象</h2>

<a id="schemarespfavoritefolder对象"></a>
<a id="schema_RespFavoriteFolder对象"></a>
<a id="tocSrespfavoritefolder对象"></a>
<a id="tocsrespfavoritefolder对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "userId": 0,
    "folderName": "string",
    "creationTime": "2019-08-24T14:15:22Z",
    "updateTime": "2019-08-24T14:15:22Z",
    "isDeleted": 0,
    "reviewStatus": 0,
    "visibility": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[FavoriteFolder对象](#schemafavoritefolder%e5%af%b9%e8%b1%a1)|false|none||收藏夹信息|

<h2 id="tocS_FavoriteFolderCreateDTO">FavoriteFolderCreateDTO</h2>

<a id="schemafavoritefoldercreatedto"></a>
<a id="schema_FavoriteFolderCreateDTO"></a>
<a id="tocSfavoritefoldercreatedto"></a>
<a id="tocsfavoritefoldercreatedto"></a>

```json
{
  "folderName": "string",
  "visibility": 0
}

```

收藏夹创建

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|folderName|string|true|none||收藏夹名称|
|visibility|integer(int32)|false|none||可见性(0:自己可见 1:公开可见)|

<h2 id="tocS_PageSection对象">PageSection对象</h2>

<a id="schemapagesection对象"></a>
<a id="schema_PageSection对象"></a>
<a id="tocSpagesection对象"></a>
<a id="tocspagesection对象"></a>

```json
{
  "records": [
    {
      "id": 0,
      "sectionName": "string",
      "sectionDescription": "string",
      "creationTime": "2019-08-24T14:15:22Z",
      "updateTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0,
      "visibility": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "sectionName": "string",
        "sectionDescription": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "visibility": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "sectionName": "string",
        "sectionDescription": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "visibility": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[Section对象](#schemasection%e5%af%b9%e8%b1%a1)]|false|none||[分区信息]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageSection对象](#schemapagesection%e5%af%b9%e8%b1%a1)|false|none||none|
|searchCount|[PageSection对象](#schemapagesection%e5%af%b9%e8%b1%a1)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_ReportHandleDTO">ReportHandleDTO</h2>

<a id="schemareporthandledto"></a>
<a id="schema_ReportHandleDTO"></a>
<a id="tocSreporthandledto"></a>
<a id="tocsreporthandledto"></a>

```json
{
  "reportId": 0,
  "status": 0,
  "outcome": 0
}

```

举报处理参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|reportId|integer(int64)|true|none||举报ID|
|status|integer(int32)|true|none||处理状态(0:待处理 1:正在处理 2:已处理 3:无需处理)|
|outcome|integer(int32)|true|none||处理结果(0:无行动 1:内容已删除 2:警告用户 3:用户禁言 4:用户封禁)|

<h2 id="tocS_RespPageSection对象">RespPageSection对象</h2>

<a id="schemaresppagesection对象"></a>
<a id="schema_RespPageSection对象"></a>
<a id="tocSresppagesection对象"></a>
<a id="tocsresppagesection对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "sectionName": "string",
        "sectionDescription": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "visibility": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageSection对象](#schemapagesection%e5%af%b9%e8%b1%a1)|false|none||none|

<h2 id="tocS_AdminLoginDTO">AdminLoginDTO</h2>

<a id="schemaadminlogindto"></a>
<a id="schema_AdminLoginDTO"></a>
<a id="tocSadminlogindto"></a>
<a id="tocsadminlogindto"></a>

```json
{
  "username": "string",
  "password": "string",
  "lastLoginTime": "2019-08-24T14:15:22Z",
  "lastLoginLocation": "string"
}

```

管理员登录请求参数

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|username|string|true|none||用户名|
|password|string|true|none||密码|
|lastLoginTime|string(date-time)|false|none||最后登录时间|
|lastLoginLocation|string|false|none||最后登录地点|

<h2 id="tocS_RespSection对象">RespSection对象</h2>

<a id="schemarespsection对象"></a>
<a id="schema_RespSection对象"></a>
<a id="tocSrespsection对象"></a>
<a id="tocsrespsection对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "sectionName": "string",
    "sectionDescription": "string",
    "creationTime": "2019-08-24T14:15:22Z",
    "updateTime": "2019-08-24T14:15:22Z",
    "isDeleted": 0,
    "visibility": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[Section对象](#schemasection%e5%af%b9%e8%b1%a1)|false|none||分区信息|

<h2 id="tocS_RespLong">RespLong</h2>

<a id="schemaresplong"></a>
<a id="schema_RespLong"></a>
<a id="tocSresplong"></a>
<a id="tocsresplong"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|integer(int64)|false|none||none|

<h2 id="tocS_PageView对象">PageView对象</h2>

<a id="schemapageview对象"></a>
<a id="schema_PageView对象"></a>
<a id="tocSpageview对象"></a>
<a id="tocspageview对象"></a>

```json
{
  "records": [
    {
      "id": 0,
      "userId": 0,
      "postId": 0,
      "viewTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "postId": 0,
        "viewTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "postId": 0,
        "viewTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[View对象](#schemaview%e5%af%b9%e8%b1%a1)]|false|none||[浏览记录信息]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageView对象](#schemapageview%e5%af%b9%e8%b1%a1)|false|none||none|
|searchCount|[PageView对象](#schemapageview%e5%af%b9%e8%b1%a1)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_PageNotification对象">PageNotification对象</h2>

<a id="schemapagenotification对象"></a>
<a id="schema_PageNotification对象"></a>
<a id="tocSpagenotification对象"></a>
<a id="tocspagenotification对象"></a>

```json
{
  "records": [
    {
      "id": 0,
      "userSenderId": 0,
      "userReceiverId": 0,
      "title": "string",
      "content": "string",
      "type": 0,
      "status": 0,
      "creationTime": "2019-08-24T14:15:22Z",
      "readTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "userSenderId": 0,
        "userReceiverId": 0,
        "title": "string",
        "content": "string",
        "type": 0,
        "status": 0,
        "creationTime": "2019-08-24T14:15:22Z",
        "readTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "userSenderId": 0,
        "userReceiverId": 0,
        "title": "string",
        "content": "string",
        "type": 0,
        "status": 0,
        "creationTime": "2019-08-24T14:15:22Z",
        "readTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[Notification对象](#schemanotification%e5%af%b9%e8%b1%a1)]|false|none||[通知信息]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageNotification对象](#schemapagenotification%e5%af%b9%e8%b1%a1)|false|none||none|
|searchCount|[PageNotification对象](#schemapagenotification%e5%af%b9%e8%b1%a1)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageView对象">RespPageView对象</h2>

<a id="schemaresppageview对象"></a>
<a id="schema_RespPageView对象"></a>
<a id="tocSresppageview对象"></a>
<a id="tocsresppageview对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "postId": 0,
        "viewTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageView对象](#schemapageview%e5%af%b9%e8%b1%a1)|false|none||none|

<h2 id="tocS_RespPageNotification对象">RespPageNotification对象</h2>

<a id="schemaresppagenotification对象"></a>
<a id="schema_RespPageNotification对象"></a>
<a id="tocSresppagenotification对象"></a>
<a id="tocsresppagenotification对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "userSenderId": 0,
        "userReceiverId": 0,
        "title": "string",
        "content": "string",
        "type": 0,
        "status": 0,
        "creationTime": "2019-08-24T14:15:22Z",
        "readTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageNotification对象](#schemapagenotification%e5%af%b9%e8%b1%a1)|false|none||none|

<h2 id="tocS_View对象">View对象</h2>

<a id="schemaview对象"></a>
<a id="schema_View对象"></a>
<a id="tocSview对象"></a>
<a id="tocsview对象"></a>

```json
{
  "id": 0,
  "userId": 0,
  "postId": 0,
  "viewTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0
}

```

浏览记录信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||主键ID|
|userId|integer(int64)|false|none||用户ID|
|postId|integer(int64)|false|none||帖子ID|
|viewTime|string(date-time)|false|none||浏览时间|
|isDeleted|integer(int32)|false|none||是否删除(1:是 0:否)|

<h2 id="tocS_CommentRequest">CommentRequest</h2>

<a id="schemacommentrequest"></a>
<a id="schema_CommentRequest"></a>
<a id="tocScommentrequest"></a>
<a id="tocscommentrequest"></a>

```json
{
  "content": "string",
  "parentId": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|content|string|false|none||none|
|parentId|integer(int64)|false|none||none|

<h2 id="tocS_ReviewManageDTO">ReviewManageDTO</h2>

<a id="schemareviewmanagedto"></a>
<a id="schema_ReviewManageDTO"></a>
<a id="tocSreviewmanagedto"></a>
<a id="tocsreviewmanagedto"></a>

```json
{
  "id": 0,
  "targetId": 0,
  "type": 1,
  "status": 2,
  "reason": "string"
}

```

审核处理DTO

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|true|none||审核记录ID|
|targetId|integer(int64)|true|none||审核对象ID|
|type|integer(int32)|true|none||审核类型：1-帖子 2-用户 3-合集 4-收藏夹|
|status|integer(int32)|true|none||审核状态：0-待处理 1-通过 2-拒绝|
|reason|string|true|none||处理原因|

<h2 id="tocS_AiWritingRequest">AiWritingRequest</h2>

<a id="schemaaiwritingrequest"></a>
<a id="schema_AiWritingRequest"></a>
<a id="tocSaiwritingrequest"></a>
<a id="tocsaiwritingrequest"></a>

```json
{
  "title": "string",
  "description": "string",
  "existingContent": "string",
  "outputFormat": "string",
  "writingStyle": "string",
  "targetWordCount": 0
}

```

写作辅助请求

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|title|string|true|none||文章标题|
|description|string|false|none||文章简述|
|existingContent|string|false|none||已有的部分内容|
|outputFormat|string|true|none||期望输出格式(md/txt)|
|writingStyle|string|false|none||写作风格(正式/轻松/专业等)|
|targetWordCount|integer(int32)|false|none||期望字数|

<h2 id="tocS_PageReportedType">PageReportedType</h2>

<a id="schemapagereportedtype"></a>
<a id="schema_PageReportedType"></a>
<a id="tocSpagereportedtype"></a>
<a id="tocspagereportedtype"></a>

```json
{
  "records": [
    {
      "id": 0,
      "typeName": "string",
      "typeDescription": "string",
      "isActive": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "typeName": "string",
        "typeDescription": "string",
        "isActive": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "typeName": "string",
        "typeDescription": "string",
        "isActive": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[ReportedType](#schemareportedtype)]|false|none||[举报对象类型实体]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageReportedType](#schemapagereportedtype)|false|none||none|
|searchCount|[PageReportedType](#schemapagereportedtype)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_PageReviewLog对象">PageReviewLog对象</h2>

<a id="schemapagereviewlog对象"></a>
<a id="schema_PageReviewLog对象"></a>
<a id="tocSpagereviewlog对象"></a>
<a id="tocspagereviewlog对象"></a>

```json
{
  "records": [
    {
      "id": 0,
      "contentId": 0,
      "contentType": 0,
      "reviewerId": 0,
      "reviewStatus": 0,
      "reviewTime": "2019-08-24T14:15:22Z",
      "reviewNotes": "string"
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "contentId": 0,
        "contentType": 0,
        "reviewerId": 0,
        "reviewStatus": 0,
        "reviewTime": "2019-08-24T14:15:22Z",
        "reviewNotes": "string"
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "contentId": 0,
        "contentType": 0,
        "reviewerId": 0,
        "reviewStatus": 0,
        "reviewTime": "2019-08-24T14:15:22Z",
        "reviewNotes": "string"
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[ReviewLog对象](#schemareviewlog%e5%af%b9%e8%b1%a1)]|false|none||[审核日志信息]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageReviewLog对象](#schemapagereviewlog%e5%af%b9%e8%b1%a1)|false|none||none|
|searchCount|[PageReviewLog对象](#schemapagereviewlog%e5%af%b9%e8%b1%a1)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageReportedType">RespPageReportedType</h2>

<a id="schemaresppagereportedtype"></a>
<a id="schema_RespPageReportedType"></a>
<a id="tocSresppagereportedtype"></a>
<a id="tocsresppagereportedtype"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "typeName": "string",
        "typeDescription": "string",
        "isActive": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageReportedType](#schemapagereportedtype)|false|none||none|

<h2 id="tocS_RespPageReviewLog对象">RespPageReviewLog对象</h2>

<a id="schemaresppagereviewlog对象"></a>
<a id="schema_RespPageReviewLog对象"></a>
<a id="tocSresppagereviewlog对象"></a>
<a id="tocsresppagereviewlog对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "contentId": 0,
        "contentType": 0,
        "reviewerId": 0,
        "reviewStatus": 0,
        "reviewTime": "2019-08-24T14:15:22Z",
        "reviewNotes": "string"
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageReviewLog对象](#schemapagereviewlog%e5%af%b9%e8%b1%a1)|false|none||none|

<h2 id="tocS_PageReportType">PageReportType</h2>

<a id="schemapagereporttype"></a>
<a id="schema_PageReportType"></a>
<a id="tocSpagereporttype"></a>
<a id="tocspagereporttype"></a>

```json
{
  "records": [
    {
      "id": 0,
      "typeName": "string",
      "typeDescription": "string",
      "isActive": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "typeName": "string",
        "typeDescription": "string",
        "isActive": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "typeName": "string",
        "typeDescription": "string",
        "isActive": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[ReportType](#schemareporttype)]|false|none||[举报类型实体]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageReportType](#schemapagereporttype)|false|none||none|
|searchCount|[PageReportType](#schemapagereporttype)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_UserCreateDTO">UserCreateDTO</h2>

<a id="schemausercreatedto"></a>
<a id="schema_UserCreateDTO"></a>
<a id="tocSusercreatedto"></a>
<a id="tocsusercreatedto"></a>

```json
{
  "username": "string",
  "password": "string",
  "email": "string",
  "phoneNumber": "string",
  "isAdmin": 1,
  "isFrozen": 1,
  "permissionLevel": 2,
  "gender": 2,
  "birthDate": "2019-08-24",
  "bio": "string",
  "avatar": "string",
  "reviewStatus": 2
}

```

管理员创建用户DTO

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|username|string|true|none||用户名|
|password|string|true|none||密码|
|email|string|false|none||邮箱|
|phoneNumber|string|false|none||手机号|
|isAdmin|integer(int32)|false|none||是否管理员（0否 1是）|
|isFrozen|integer(int32)|false|none||是否冻结（0否 1是）|
|permissionLevel|integer(int32)|false|none||权限等级（0正常 1禁止评论 2禁止发帖）|
|gender|integer(int32)|false|none||性别（0男 1女 2其他）|
|birthDate|string(date)|false|none||出生日期|
|bio|string|false|none||个人简介|
|avatar|string(binary)|false|none||none|
|reviewStatus|integer(int32)|false|none||审核状态（0待审核 1已通过 2已拒绝）|

<h2 id="tocS_RespPageReportType">RespPageReportType</h2>

<a id="schemaresppagereporttype"></a>
<a id="schema_RespPageReportType"></a>
<a id="tocSresppagereporttype"></a>
<a id="tocsresppagereporttype"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "typeName": "string",
        "typeDescription": "string",
        "isActive": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageReportType](#schemapagereporttype)|false|none||none|

<h2 id="tocS_PageFavoriteFolder对象">PageFavoriteFolder对象</h2>

<a id="schemapagefavoritefolder对象"></a>
<a id="schema_PageFavoriteFolder对象"></a>
<a id="tocSpagefavoritefolder对象"></a>
<a id="tocspagefavoritefolder对象"></a>

```json
{
  "records": [
    {
      "id": 0,
      "userId": 0,
      "folderName": "string",
      "creationTime": "2019-08-24T14:15:22Z",
      "updateTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0,
      "reviewStatus": 0,
      "visibility": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "folderName": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "reviewStatus": 0,
        "visibility": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "folderName": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "reviewStatus": 0,
        "visibility": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[FavoriteFolder对象](#schemafavoritefolder%e5%af%b9%e8%b1%a1)]|false|none||[收藏夹信息]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageFavoriteFolder对象](#schemapagefavoritefolder%e5%af%b9%e8%b1%a1)|false|none||none|
|searchCount|[PageFavoriteFolder对象](#schemapagefavoritefolder%e5%af%b9%e8%b1%a1)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageFavoriteFolder对象">RespPageFavoriteFolder对象</h2>

<a id="schemaresppagefavoritefolder对象"></a>
<a id="schema_RespPageFavoriteFolder对象"></a>
<a id="tocSresppagefavoritefolder对象"></a>
<a id="tocsresppagefavoritefolder对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "folderName": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0,
        "reviewStatus": 0,
        "visibility": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageFavoriteFolder对象](#schemapagefavoritefolder%e5%af%b9%e8%b1%a1)|false|none||none|

<h2 id="tocS_PageFeedback对象">PageFeedback对象</h2>

<a id="schemapagefeedback对象"></a>
<a id="schema_PageFeedback对象"></a>
<a id="tocSpagefeedback对象"></a>
<a id="tocspagefeedback对象"></a>

```json
{
  "records": [
    {
      "id": 0,
      "userId": 0,
      "feedbackContent": "string",
      "feedbackTime": "2019-08-24T14:15:22Z",
      "status": 0,
      "isDeleted": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "feedbackContent": "string",
        "feedbackTime": "2019-08-24T14:15:22Z",
        "status": 0,
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "feedbackContent": "string",
        "feedbackTime": "2019-08-24T14:15:22Z",
        "status": 0,
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[Feedback对象](#schemafeedback%e5%af%b9%e8%b1%a1)]|false|none||[反馈信息]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageFeedback对象](#schemapagefeedback%e5%af%b9%e8%b1%a1)|false|none||none|
|searchCount|[PageFeedback对象](#schemapagefeedback%e5%af%b9%e8%b1%a1)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageFeedback对象">RespPageFeedback对象</h2>

<a id="schemaresppagefeedback对象"></a>
<a id="schema_RespPageFeedback对象"></a>
<a id="tocSresppagefeedback对象"></a>
<a id="tocsresppagefeedback对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "feedbackContent": "string",
        "feedbackTime": "2019-08-24T14:15:22Z",
        "status": 0,
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageFeedback对象](#schemapagefeedback%e5%af%b9%e8%b1%a1)|false|none||none|

<h2 id="tocS_Favorite对象">Favorite对象</h2>

<a id="schemafavorite对象"></a>
<a id="schema_Favorite对象"></a>
<a id="tocSfavorite对象"></a>
<a id="tocsfavorite对象"></a>

```json
{
  "id": 0,
  "userId": 0,
  "postId": 0,
  "folderId": 0,
  "favoriteTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0
}

```

收藏信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||主键ID|
|userId|integer(int64)|false|none||用户ID|
|postId|integer(int64)|false|none||帖子ID|
|folderId|integer(int64)|false|none||收藏夹ID|
|favoriteTime|string(date-time)|false|none||收藏时间|
|isDeleted|integer(int32)|false|none||是否删除(1:是 0:否)|

<h2 id="tocS_PageFavorite对象">PageFavorite对象</h2>

<a id="schemapagefavorite对象"></a>
<a id="schema_PageFavorite对象"></a>
<a id="tocSpagefavorite对象"></a>
<a id="tocspagefavorite对象"></a>

```json
{
  "records": [
    {
      "id": 0,
      "userId": 0,
      "postId": 0,
      "folderId": 0,
      "favoriteTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "postId": 0,
        "folderId": 0,
        "favoriteTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "postId": 0,
        "folderId": 0,
        "favoriteTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[Favorite对象](#schemafavorite%e5%af%b9%e8%b1%a1)]|false|none||[收藏信息]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageFavorite对象](#schemapagefavorite%e5%af%b9%e8%b1%a1)|false|none||none|
|searchCount|[PageFavorite对象](#schemapagefavorite%e5%af%b9%e8%b1%a1)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_PageCitationType">PageCitationType</h2>

<a id="schemapagecitationtype"></a>
<a id="schema_PageCitationType"></a>
<a id="tocSpagecitationtype"></a>
<a id="tocspagecitationtype"></a>

```json
{
  "records": [
    {
      "id": 0,
      "typeName": "string",
      "typeDescription": "string",
      "isActive": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "typeName": "string",
        "typeDescription": "string",
        "isActive": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "typeName": "string",
        "typeDescription": "string",
        "isActive": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[CitationType](#schemacitationtype)]|false|none||[引用类型实体]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageCitationType](#schemapagecitationtype)|false|none||none|
|searchCount|[PageCitationType](#schemapagecitationtype)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageFavorite对象">RespPageFavorite对象</h2>

<a id="schemaresppagefavorite对象"></a>
<a id="schema_RespPageFavorite对象"></a>
<a id="tocSresppagefavorite对象"></a>
<a id="tocsresppagefavorite对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "postId": 0,
        "folderId": 0,
        "favoriteTime": "2019-08-24T14:15:22Z",
        "isDeleted": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {},
    "searchCount": {},
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageFavorite对象](#schemapagefavorite%e5%af%b9%e8%b1%a1)|false|none||none|

<h2 id="tocS_RespListSection对象">RespListSection对象</h2>

<a id="schemaresplistsection对象"></a>
<a id="schema_RespListSection对象"></a>
<a id="tocSresplistsection对象"></a>
<a id="tocsresplistsection对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "id": 0,
      "sectionName": "string",
      "sectionDescription": "string",
      "creationTime": "2019-08-24T14:15:22Z",
      "updateTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0,
      "visibility": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[Section对象](#schemasection%e5%af%b9%e8%b1%a1)]|false|none||[分区信息]|

<h2 id="tocS_RespPageCitationType">RespPageCitationType</h2>

<a id="schemaresppagecitationtype"></a>
<a id="schema_RespPageCitationType"></a>
<a id="tocSresppagecitationtype"></a>
<a id="tocsresppagecitationtype"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "typeName": "string",
        "typeDescription": "string",
        "isActive": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "typeName": "string",
          "typeDescription": "string",
          "isActive": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageCitationType](#schemapagecitationtype)|false|none||none|

<h2 id="tocS_RespNotification对象">RespNotification对象</h2>

<a id="schemarespnotification对象"></a>
<a id="schema_RespNotification对象"></a>
<a id="tocSrespnotification对象"></a>
<a id="tocsrespnotification对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "userSenderId": 0,
    "userReceiverId": 0,
    "title": "string",
    "content": "string",
    "type": 0,
    "status": 0,
    "creationTime": "2019-08-24T14:15:22Z",
    "readTime": "2019-08-24T14:15:22Z",
    "isDeleted": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[Notification对象](#schemanotification%e5%af%b9%e8%b1%a1)|false|none||通知信息|

<h2 id="tocS_RespListPost">RespListPost</h2>

<a id="schemaresplistpost"></a>
<a id="schema_RespListPost"></a>
<a id="tocSresplistpost"></a>
<a id="tocsresplistpost"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "id": 0,
      "userId": 0,
      "sectionId": 0,
      "tags": "string",
      "cover": "string",
      "summary": "string",
      "citation": "string",
      "collectionId": 0,
      "title": "string",
      "contentFileId": "string",
      "contentFilePath": "string",
      "publishTime": "2019-08-24T14:15:22Z",
      "updateTime": "2019-08-24T14:15:22Z",
      "viewCount": 0,
      "commentCount": 0,
      "likeCount": 0,
      "shareCount": 0,
      "status": 0,
      "isPinned": 0,
      "isEssence": 0,
      "visibility": 0,
      "reviewStatus": 0,
      "isDeleted": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[Post](#schemapost)]|false|none||[帖子实体类]|

<h2 id="tocS_SseEmitter">SseEmitter</h2>

<a id="schemasseemitter"></a>
<a id="schema_SseEmitter"></a>
<a id="tocSsseemitter"></a>
<a id="tocssseemitter"></a>

```json
{
  "timeout": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|timeout|integer(int64)|false|none||none|

<h2 id="tocS_RespListNotification对象">RespListNotification对象</h2>

<a id="schemaresplistnotification对象"></a>
<a id="schema_RespListNotification对象"></a>
<a id="tocSresplistnotification对象"></a>
<a id="tocsresplistnotification对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "id": 0,
      "userSenderId": 0,
      "userReceiverId": 0,
      "title": "string",
      "content": "string",
      "type": 0,
      "status": 0,
      "creationTime": "2019-08-24T14:15:22Z",
      "readTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[Notification对象](#schemanotification%e5%af%b9%e8%b1%a1)]|false|none||[通知信息]|

<h2 id="tocS_RecommendationDTO">RecommendationDTO</h2>

<a id="schemarecommendationdto"></a>
<a id="schema_RecommendationDTO"></a>
<a id="tocSrecommendationdto"></a>
<a id="tocsrecommendationdto"></a>

```json
{
  "postId": 0,
  "title": "string",
  "description": "string",
  "coverUrl": "string",
  "score": 0.1
}

```

推荐内容DTO

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|postId|integer(int64)|false|none||帖子ID|
|title|string|false|none||帖子标题|
|description|string|false|none||帖子描述|
|coverUrl|string|false|none||封面图片URL|
|score|number(double)|false|none||推荐分数|

<h2 id="tocS_RespListRecommendationDTO">RespListRecommendationDTO</h2>

<a id="schemaresplistrecommendationdto"></a>
<a id="schema_RespListRecommendationDTO"></a>
<a id="tocSresplistrecommendationdto"></a>
<a id="tocsresplistrecommendationdto"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "postId": 0,
      "title": "string",
      "description": "string",
      "coverUrl": "string",
      "score": 0.1
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[RecommendationDTO](#schemarecommendationdto)]|false|none||[推荐内容DTO]|

<h2 id="tocS_RespListFeedback对象">RespListFeedback对象</h2>

<a id="schemaresplistfeedback对象"></a>
<a id="schema_RespListFeedback对象"></a>
<a id="tocSresplistfeedback对象"></a>
<a id="tocsresplistfeedback对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "id": 0,
      "userId": 0,
      "feedbackContent": "string",
      "feedbackTime": "2019-08-24T14:15:22Z",
      "status": 0,
      "isDeleted": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[Feedback对象](#schemafeedback%e5%af%b9%e8%b1%a1)]|false|none||[反馈信息]|

<h2 id="tocS_NotificationVO">NotificationVO</h2>

<a id="schemanotificationvo"></a>
<a id="schema_NotificationVO"></a>
<a id="tocSnotificationvo"></a>
<a id="tocsnotificationvo"></a>

```json
{
  "id": 1,
  "type": "comment",
  "content": "有人评论了你的视频",
  "isRead": false,
  "createTime": "2019-08-24T14:15:22Z"
}

```

消息通知视图对象

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||通知ID|
|type|string|false|none||通知类型|
|content|string|false|none||通知内容|
|isRead|boolean|false|none||是否已读|
|createTime|string(date-time)|false|none||创建时间|

<h2 id="tocS_RecommendContentVO">RecommendContentVO</h2>

<a id="schemarecommendcontentvo"></a>
<a id="schema_RecommendContentVO"></a>
<a id="tocSrecommendcontentvo"></a>
<a id="tocsrecommendcontentvo"></a>

```json
{
  "post": {
    "id": 0,
    "userId": 0,
    "sectionId": 0,
    "tags": "string",
    "cover": "string",
    "summary": "string",
    "citation": "string",
    "collectionId": 0,
    "title": "string",
    "contentFileId": "string",
    "contentFilePath": "string",
    "publishTime": "2019-08-24T14:15:22Z",
    "updateTime": "2019-08-24T14:15:22Z",
    "viewCount": 0,
    "commentCount": 0,
    "likeCount": 0,
    "shareCount": 0,
    "status": 0,
    "isPinned": 0,
    "isEssence": 0,
    "visibility": 0,
    "reviewStatus": 0,
    "isDeleted": 0
  },
  "author": {
    "id": 1,
    "username": "张三",
    "avatarUrl": "http://example.com/avatar.jpg"
  }
}

```

推荐内容视图对象

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|post|[Post](#schemapost)|false|none||帖子实体类|
|author|[UserBriefVO](#schemauserbriefvo)|false|none||用户简要信息视图对象|

<h2 id="tocS_RespSearchResultPost">RespSearchResultPost</h2>

<a id="schemarespsearchresultpost"></a>
<a id="schema_RespSearchResultPost"></a>
<a id="tocSrespsearchresultpost"></a>
<a id="tocsrespsearchresultpost"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "total": 0,
    "hits": [
      {
        "source": {
          "id": 0,
          "userId": 0,
          "sectionId": 0,
          "tags": "string",
          "cover": "string",
          "summary": "string",
          "citation": "string",
          "collectionId": 0,
          "title": "string",
          "contentFileId": "string",
          "contentFilePath": "string",
          "publishTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "viewCount": 0,
          "commentCount": 0,
          "likeCount": 0,
          "shareCount": 0,
          "status": 0,
          "isPinned": 0,
          "isEssence": 0,
          "visibility": 0,
          "reviewStatus": 0,
          "isDeleted": 0
        },
        "score": 0.1,
        "highlight": {
          "property1": [
            "string"
          ],
          "property2": [
            "string"
          ]
        }
      }
    ]
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[SearchResultPost](#schemasearchresultpost)|false|none||none|

<h2 id="tocS_SectionVO">SectionVO</h2>

<a id="schemasectionvo"></a>
<a id="schema_SectionVO"></a>
<a id="tocSsectionvo"></a>
<a id="tocssectionvo"></a>

```json
{
  "id": 0,
  "sectionName": "string",
  "sectionDescription": "string"
}

```

分区视图对象

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||主键ID|
|sectionName|string|false|none||分区名称|
|sectionDescription|string|false|none||分区描述|

<h2 id="tocS_SearchHitPost">SearchHitPost</h2>

<a id="schemasearchhitpost"></a>
<a id="schema_SearchHitPost"></a>
<a id="tocSsearchhitpost"></a>
<a id="tocssearchhitpost"></a>

```json
{
  "source": {
    "id": 0,
    "userId": 0,
    "sectionId": 0,
    "tags": "string",
    "cover": "string",
    "summary": "string",
    "citation": "string",
    "collectionId": 0,
    "title": "string",
    "contentFileId": "string",
    "contentFilePath": "string",
    "publishTime": "2019-08-24T14:15:22Z",
    "updateTime": "2019-08-24T14:15:22Z",
    "viewCount": 0,
    "commentCount": 0,
    "likeCount": 0,
    "shareCount": 0,
    "status": 0,
    "isPinned": 0,
    "isEssence": 0,
    "visibility": 0,
    "reviewStatus": 0,
    "isDeleted": 0
  },
  "score": 0.1,
  "highlight": {
    "property1": [
      "string"
    ],
    "property2": [
      "string"
    ]
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|source|[Post](#schemapost)|false|none||帖子实体类|
|score|number(double)|false|none||none|
|highlight|object|false|none||none|
|» **additionalProperties**|[string]|false|none||none|

<h2 id="tocS_UserBriefVO">UserBriefVO</h2>

<a id="schemauserbriefvo"></a>
<a id="schema_UserBriefVO"></a>
<a id="tocSuserbriefvo"></a>
<a id="tocsuserbriefvo"></a>

```json
{
  "id": 1,
  "username": "张三",
  "avatarUrl": "http://example.com/avatar.jpg"
}

```

用户简要信息视图对象

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||用户ID|
|username|string|false|none||用户名|
|avatarUrl|string|false|none||头像URL|

<h2 id="tocS_SearchResultPost">SearchResultPost</h2>

<a id="schemasearchresultpost"></a>
<a id="schema_SearchResultPost"></a>
<a id="tocSsearchresultpost"></a>
<a id="tocssearchresultpost"></a>

```json
{
  "total": 0,
  "hits": [
    {
      "source": {
        "id": 0,
        "userId": 0,
        "sectionId": 0,
        "tags": "string",
        "cover": "string",
        "summary": "string",
        "citation": "string",
        "collectionId": 0,
        "title": "string",
        "contentFileId": "string",
        "contentFilePath": "string",
        "publishTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "viewCount": 0,
        "commentCount": 0,
        "likeCount": 0,
        "shareCount": 0,
        "status": 0,
        "isPinned": 0,
        "isEssence": 0,
        "visibility": 0,
        "reviewStatus": 0,
        "isDeleted": 0
      },
      "score": 0.1,
      "highlight": {
        "property1": [
          "string"
        ],
        "property2": [
          "string"
        ]
      }
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|total|integer(int64)|false|none||none|
|hits|[[SearchHitPost](#schemasearchhitpost)]|false|none||none|

<h2 id="tocS_RespUserBriefVO">RespUserBriefVO</h2>

<a id="schemarespuserbriefvo"></a>
<a id="schema_RespUserBriefVO"></a>
<a id="tocSrespuserbriefvo"></a>
<a id="tocsrespuserbriefvo"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 1,
    "username": "张三",
    "avatarUrl": "http://example.com/avatar.jpg"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[UserBriefVO](#schemauserbriefvo)|false|none||用户简要信息视图对象|

<h2 id="tocS_RespListSectionVO">RespListSectionVO</h2>

<a id="schemaresplistsectionvo"></a>
<a id="schema_RespListSectionVO"></a>
<a id="tocSresplistsectionvo"></a>
<a id="tocsresplistsectionvo"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "id": 0,
      "sectionName": "string",
      "sectionDescription": "string"
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[SectionVO](#schemasectionvo)]|false|none||[分区视图对象]|

<h2 id="tocS_RespListRecommendContentVO">RespListRecommendContentVO</h2>

<a id="schemaresplistrecommendcontentvo"></a>
<a id="schema_RespListRecommendContentVO"></a>
<a id="tocSresplistrecommendcontentvo"></a>
<a id="tocsresplistrecommendcontentvo"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "post": {
        "id": 0,
        "userId": 0,
        "sectionId": 0,
        "tags": "string",
        "cover": "string",
        "summary": "string",
        "citation": "string",
        "collectionId": 0,
        "title": "string",
        "contentFileId": "string",
        "contentFilePath": "string",
        "publishTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "viewCount": 0,
        "commentCount": 0,
        "likeCount": 0,
        "shareCount": 0,
        "status": 0,
        "isPinned": 0,
        "isEssence": 0,
        "visibility": 0,
        "reviewStatus": 0,
        "isDeleted": 0
      },
      "author": {
        "id": 1,
        "username": "张三",
        "avatarUrl": "http://example.com/avatar.jpg"
      }
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[RecommendContentVO](#schemarecommendcontentvo)]|false|none||[推荐内容视图对象]|

<h2 id="tocS_RespListNotificationVO">RespListNotificationVO</h2>

<a id="schemaresplistnotificationvo"></a>
<a id="schema_RespListNotificationVO"></a>
<a id="tocSresplistnotificationvo"></a>
<a id="tocsresplistnotificationvo"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "id": 1,
      "type": "comment",
      "content": "有人评论了你的视频",
      "isRead": false,
      "createTime": "2019-08-24T14:15:22Z"
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[NotificationVO](#schemanotificationvo)]|false|none||[消息通知视图对象]|

<h2 id="tocS_RespListCitation">RespListCitation</h2>

<a id="schemaresplistcitation"></a>
<a id="schema_RespListCitation"></a>
<a id="tocSresplistcitation"></a>
<a id="tocsresplistcitation"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "id": 0,
      "postId": 0,
      "citationTypeId": 0,
      "citationContent": "string",
      "source": "string",
      "citationTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[Citation](#schemacitation)]|false|none||[引用实体]|

<h2 id="tocS_CollectionDetailVO">CollectionDetailVO</h2>

<a id="schemacollectiondetailvo"></a>
<a id="schema_CollectionDetailVO"></a>
<a id="tocScollectiondetailvo"></a>
<a id="tocscollectiondetailvo"></a>

```json
{
  "id": 1,
  "title": "精选合集",
  "description": "这是一个精选合集",
  "likeCount": 0,
  "shareCount": 0,
  "commentCount": 0,
  "subscribeCount": 0,
  "createTime": "2019-08-24T14:15:22Z"
}

```

合集详情视图对象

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||合集ID|
|title|string|false|none||合集标题|
|description|string|false|none||合集描述|
|likeCount|integer(int32)|false|none||点赞数|
|shareCount|integer(int32)|false|none||分享数|
|commentCount|integer(int32)|false|none||评论数|
|subscribeCount|integer(int32)|false|none||订阅数|
|createTime|string(date-time)|false|none||创建时间|

<h2 id="tocS_RespListUserFollowDetailVO">RespListUserFollowDetailVO</h2>

<a id="schemaresplistuserfollowdetailvo"></a>
<a id="schema_RespListUserFollowDetailVO"></a>
<a id="tocSresplistuserfollowdetailvo"></a>
<a id="tocsresplistuserfollowdetailvo"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "userId": 0,
      "username": "string",
      "avatar": "string"
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[UserFollowDetailVO](#schemauserfollowdetailvo)]|false|none||none|

<h2 id="tocS_RespCollectionDetailVO">RespCollectionDetailVO</h2>

<a id="schemarespcollectiondetailvo"></a>
<a id="schema_RespCollectionDetailVO"></a>
<a id="tocSrespcollectiondetailvo"></a>
<a id="tocsrespcollectiondetailvo"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 1,
    "title": "精选合集",
    "description": "这是一个精选合集",
    "likeCount": 0,
    "shareCount": 0,
    "commentCount": 0,
    "subscribeCount": 0,
    "createTime": "2019-08-24T14:15:22Z"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[CollectionDetailVO](#schemacollectiondetailvo)|false|none||合集详情视图对象|

<h2 id="tocS_UserFollowDetailVO">UserFollowDetailVO</h2>

<a id="schemauserfollowdetailvo"></a>
<a id="schema_UserFollowDetailVO"></a>
<a id="tocSuserfollowdetailvo"></a>
<a id="tocsuserfollowdetailvo"></a>

```json
{
  "userId": 0,
  "username": "string",
  "avatar": "string"
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|userId|integer(int64)|false|none||none|
|username|string|false|none||none|
|avatar|string|false|none||none|

<h2 id="tocS_RespMapStringInteger">RespMapStringInteger</h2>

<a id="schemarespmapstringinteger"></a>
<a id="schema_RespMapStringInteger"></a>
<a id="tocSrespmapstringinteger"></a>
<a id="tocsrespmapstringinteger"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "property1": 0,
    "property2": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|object|false|none||none|
|» **additionalProperties**|integer(int32)|false|none||none|

<h2 id="tocS_RespListMapStringObject">RespListMapStringObject</h2>

<a id="schemaresplistmapstringobject"></a>
<a id="schema_RespListMapStringObject"></a>
<a id="tocSresplistmapstringobject"></a>
<a id="tocsresplistmapstringobject"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "property1": {},
      "property2": {}
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[object]|false|none||none|
|» **additionalProperties**|object|false|none||none|

<h2 id="tocS_RespInteger">RespInteger</h2>

<a id="schemarespinteger"></a>
<a id="schema_RespInteger"></a>
<a id="tocSrespinteger"></a>
<a id="tocsrespinteger"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|integer(int32)|false|none||none|

<h2 id="tocS_Like对象">Like对象</h2>

<a id="schemalike对象"></a>
<a id="schema_Like对象"></a>
<a id="tocSlike对象"></a>
<a id="tocslike对象"></a>

```json
{
  "id": 0,
  "userId": 0,
  "likeObjectId": 0,
  "likeObjectType": 0,
  "likeTime": "2019-08-24T14:15:22Z",
  "isDeleted": 0
}

```

点赞信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||主键ID|
|userId|integer(int64)|false|none||用户ID|
|likeObjectId|integer(int64)|false|none||被点赞对象ID|
|likeObjectType|integer(int32)|false|none||点赞对象类型(1:帖子 2:合集 3:评论)|
|likeTime|string(date-time)|false|none||点赞时间|
|isDeleted|integer(int32)|false|none||是否删除|

<h2 id="tocS_RespListLike对象">RespListLike对象</h2>

<a id="schemaresplistlike对象"></a>
<a id="schema_RespListLike对象"></a>
<a id="tocSresplistlike对象"></a>
<a id="tocsresplistlike对象"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "id": 0,
      "userId": 0,
      "likeObjectId": 0,
      "likeObjectType": 0,
      "likeTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[Like对象](#schemalike%e5%af%b9%e8%b1%a1)]|false|none||[点赞信息]|

<h2 id="tocS_RespObject">RespObject</h2>

<a id="schemarespobject"></a>
<a id="schema_RespObject"></a>
<a id="tocSrespobject"></a>
<a id="tocsrespobject"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {}
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|object|false|none||none|

<h2 id="tocS_RespListComment">RespListComment</h2>

<a id="schemaresplistcomment"></a>
<a id="schema_RespListComment"></a>
<a id="tocSresplistcomment"></a>
<a id="tocsresplistcomment"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "id": 0,
      "commenterId": 0,
      "commentableId": 0,
      "commentableType": 0,
      "content": "string",
      "creationTime": "2019-08-24T14:15:22Z",
      "isDeleted": 0,
      "parentCommentId": 0,
      "likeCount": 0,
      "replyCount": 0,
      "isPublic": 0,
      "reviewStatus": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[Comment](#schemacomment)]|false|none||[评论实体]|

<h2 id="tocS_RespListCitationType">RespListCitationType</h2>

<a id="schemaresplistcitationtype"></a>
<a id="schema_RespListCitationType"></a>
<a id="tocSresplistcitationtype"></a>
<a id="tocsresplistcitationtype"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "id": 0,
      "typeName": "string",
      "typeDescription": "string",
      "isActive": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[CitationType](#schemacitationtype)]|false|none||[引用类型实体]|

<h2 id="tocS_PostStatsDTO">PostStatsDTO</h2>

<a id="schemapoststatsdto"></a>
<a id="schema_PostStatsDTO"></a>
<a id="tocSpoststatsdto"></a>
<a id="tocspoststatsdto"></a>

```json
{
  "postId": 0,
  "viewCount": 0,
  "likeCount": 0,
  "commentCount": 0,
  "shareCount": 0,
  "favoriteCount": 0,
  "isLiked": true,
  "isFavorited": true,
  "isShared": true
}

```

帖子统计信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|postId|integer(int64)|false|none||帖子ID|
|viewCount|integer(int32)|false|none||浏览数|
|likeCount|integer(int32)|false|none||点赞数|
|commentCount|integer(int32)|false|none||评论数|
|shareCount|integer(int32)|false|none||分享数|
|favoriteCount|integer(int32)|false|none||收藏数|
|isLiked|boolean|false|none||当前用户是否点赞|
|isFavorited|boolean|false|none||当前用户是否收藏|
|isShared|boolean|false|none||当前用户是否分享|

<h2 id="tocS_RespPostStatsDTO">RespPostStatsDTO</h2>

<a id="schemaresppoststatsdto"></a>
<a id="schema_RespPostStatsDTO"></a>
<a id="tocSresppoststatsdto"></a>
<a id="tocsresppoststatsdto"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "postId": 0,
    "viewCount": 0,
    "likeCount": 0,
    "commentCount": 0,
    "shareCount": 0,
    "favoriteCount": 0,
    "isLiked": true,
    "isFavorited": true,
    "isShared": true
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PostStatsDTO](#schemapoststatsdto)|false|none||帖子统计信息|

<h2 id="tocS_PageCommentDTO">PageCommentDTO</h2>

<a id="schemapagecommentdto"></a>
<a id="schema_PageCommentDTO"></a>
<a id="tocSpagecommentdto"></a>
<a id="tocspagecommentdto"></a>

```json
{
  "records": [
    {
      "id": 0,
      "content": "string",
      "commenterId": 0,
      "commenterName": "string",
      "commenterAvatar": "string",
      "creationTime": "2019-08-24T14:15:22Z",
      "likeCount": 0,
      "isLiked": true,
      "replyCount": 0,
      "parentCommentId": 0,
      "replyToCommenterId": 0,
      "replyToCommenterName": "string",
      "isPublic": 0,
      "reviewStatus": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "content": "string",
        "commenterId": 0,
        "commenterName": "string",
        "commenterAvatar": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "likeCount": 0,
        "isLiked": true,
        "replyCount": 0,
        "parentCommentId": 0,
        "replyToCommenterId": 0,
        "replyToCommenterName": "string",
        "isPublic": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "content": "string",
          "commenterId": 0,
          "commenterName": "string",
          "commenterAvatar": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "likeCount": 0,
          "isLiked": true,
          "replyCount": 0,
          "parentCommentId": 0,
          "replyToCommenterId": 0,
          "replyToCommenterName": "string",
          "isPublic": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "content": "string",
          "commenterId": 0,
          "commenterName": "string",
          "commenterAvatar": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "likeCount": 0,
          "isLiked": true,
          "replyCount": 0,
          "parentCommentId": 0,
          "replyToCommenterId": 0,
          "replyToCommenterName": "string",
          "isPublic": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "content": "string",
        "commenterId": 0,
        "commenterName": "string",
        "commenterAvatar": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "likeCount": 0,
        "isLiked": true,
        "replyCount": 0,
        "parentCommentId": 0,
        "replyToCommenterId": 0,
        "replyToCommenterName": "string",
        "isPublic": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "content": "string",
          "commenterId": 0,
          "commenterName": "string",
          "commenterAvatar": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "likeCount": 0,
          "isLiked": true,
          "replyCount": 0,
          "parentCommentId": 0,
          "replyToCommenterId": 0,
          "replyToCommenterName": "string",
          "isPublic": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "content": "string",
          "commenterId": 0,
          "commenterName": "string",
          "commenterAvatar": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "likeCount": 0,
          "isLiked": true,
          "replyCount": 0,
          "parentCommentId": 0,
          "replyToCommenterId": 0,
          "replyToCommenterName": "string",
          "isPublic": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[CommentDTO](#schemacommentdto)]|false|none||[评论信息]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageCommentDTO](#schemapagecommentdto)|false|none||none|
|searchCount|[PageCommentDTO](#schemapagecommentdto)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageCommentDTO">RespPageCommentDTO</h2>

<a id="schemaresppagecommentdto"></a>
<a id="schema_RespPageCommentDTO"></a>
<a id="tocSresppagecommentdto"></a>
<a id="tocsresppagecommentdto"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "content": "string",
        "commenterId": 0,
        "commenterName": "string",
        "commenterAvatar": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "likeCount": 0,
        "isLiked": true,
        "replyCount": 0,
        "parentCommentId": 0,
        "replyToCommenterId": 0,
        "replyToCommenterName": "string",
        "isPublic": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "content": "string",
          "commenterId": 0,
          "commenterName": "string",
          "commenterAvatar": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "likeCount": 0,
          "isLiked": true,
          "replyCount": 0,
          "parentCommentId": 0,
          "replyToCommenterId": 0,
          "replyToCommenterName": "string",
          "isPublic": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "content": "string",
          "commenterId": 0,
          "commenterName": "string",
          "commenterAvatar": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "likeCount": 0,
          "isLiked": true,
          "replyCount": 0,
          "parentCommentId": 0,
          "replyToCommenterId": 0,
          "replyToCommenterName": "string",
          "isPublic": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageCommentDTO](#schemapagecommentdto)|false|none||none|

<h2 id="tocS_RespListReportedType">RespListReportedType</h2>

<a id="schemaresplistreportedtype"></a>
<a id="schema_RespListReportedType"></a>
<a id="tocSresplistreportedtype"></a>
<a id="tocsresplistreportedtype"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "id": 0,
      "typeName": "string",
      "typeDescription": "string",
      "isActive": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[ReportedType](#schemareportedtype)]|false|none||[举报对象类型实体]|

<h2 id="tocS_RespListString">RespListString</h2>

<a id="schemarespliststring"></a>
<a id="schema_RespListString"></a>
<a id="tocSrespliststring"></a>
<a id="tocsrespliststring"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    "string"
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[string]|false|none||none|

<h2 id="tocS_RespListReportType">RespListReportType</h2>

<a id="schemaresplistreporttype"></a>
<a id="schema_RespListReportType"></a>
<a id="tocSresplistreporttype"></a>
<a id="tocsresplistreporttype"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": [
    {
      "id": 0,
      "typeName": "string",
      "typeDescription": "string",
      "isActive": 0
    }
  ]
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[[ReportType](#schemareporttype)]|false|none||[举报类型实体]|

<h2 id="tocS_HomePageVO">HomePageVO</h2>

<a id="schemahomepagevo"></a>
<a id="schema_HomePageVO"></a>
<a id="tocShomepagevo"></a>
<a id="tocshomepagevo"></a>

```json
{
  "userInfo": {
    "id": 1,
    "username": "张三",
    "avatarUrl": "http://example.com/avatar.jpg"
  },
  "recommendContents": [
    {
      "post": {
        "id": 0,
        "userId": 0,
        "sectionId": 0,
        "tags": "string",
        "cover": "string",
        "summary": "string",
        "citation": "string",
        "collectionId": 0,
        "title": "string",
        "contentFileId": "string",
        "contentFilePath": "string",
        "publishTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z",
        "viewCount": 0,
        "commentCount": 0,
        "likeCount": 0,
        "shareCount": 0,
        "status": 0,
        "isPinned": 0,
        "isEssence": 0,
        "visibility": 0,
        "reviewStatus": 0,
        "isDeleted": 0
      },
      "author": {
        "id": 1,
        "username": "张三",
        "avatarUrl": "http://example.com/avatar.jpg"
      }
    }
  ],
  "sections": [
    {
      "id": 0,
      "sectionName": "string",
      "sectionDescription": "string"
    }
  ],
  "notifications": [
    {
      "id": 1,
      "type": "comment",
      "content": "有人评论了你的视频",
      "isRead": false,
      "createTime": "2019-08-24T14:15:22Z"
    }
  ],
  "unreadNotificationCount": 0
}

```

首页视图对象

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|userInfo|[UserBriefVO](#schemauserbriefvo)|false|none||用户简要信息视图对象|
|recommendContents|[[RecommendContentVO](#schemarecommendcontentvo)]|false|none||推荐内容列表|
|sections|[[SectionVO](#schemasectionvo)]|false|none||分区列表|
|notifications|[[NotificationVO](#schemanotificationvo)]|false|none||消息通知列表|
|unreadNotificationCount|integer(int32)|false|none||未读通知数量|

<h2 id="tocS_RespHomePageVO">RespHomePageVO</h2>

<a id="schemaresphomepagevo"></a>
<a id="schema_RespHomePageVO"></a>
<a id="tocSresphomepagevo"></a>
<a id="tocsresphomepagevo"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "userInfo": {
      "id": 1,
      "username": "张三",
      "avatarUrl": "http://example.com/avatar.jpg"
    },
    "recommendContents": [
      {
        "post": {
          "id": 0,
          "userId": 0,
          "sectionId": 0,
          "tags": "string",
          "cover": "string",
          "summary": "string",
          "citation": "string",
          "collectionId": 0,
          "title": "string",
          "contentFileId": "string",
          "contentFilePath": "string",
          "publishTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z",
          "viewCount": 0,
          "commentCount": 0,
          "likeCount": 0,
          "shareCount": 0,
          "status": 0,
          "isPinned": 0,
          "isEssence": 0,
          "visibility": 0,
          "reviewStatus": 0,
          "isDeleted": 0
        },
        "author": {
          "id": "[",
          "username": "[",
          "avatarUrl": "["
        }
      }
    ],
    "sections": [
      {
        "id": 0,
        "sectionName": "string",
        "sectionDescription": "string"
      }
    ],
    "notifications": [
      {
        "id": 1,
        "type": "comment",
        "content": "有人评论了你的视频",
        "isRead": false,
        "createTime": "2019-08-24T14:15:22Z"
      }
    ],
    "unreadNotificationCount": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[HomePageVO](#schemahomepagevo)|false|none||首页视图对象|

<h2 id="tocS_ReportVO">ReportVO</h2>

<a id="schemareportvo"></a>
<a id="schema_ReportVO"></a>
<a id="tocSreportvo"></a>
<a id="tocsreportvo"></a>

```json
{
  "id": 0,
  "userId": 0,
  "reportedContentId": 0,
  "reportedTypeId": 0,
  "reportTypeId": 0,
  "reason": "string",
  "reportTime": "2019-08-24T14:15:22Z",
  "status": 0,
  "outcome": 0,
  "isDeleted": 0,
  "username": "string",
  "reportedTypeName": "string",
  "reportTypeName": "string",
  "reportedContent": "string"
}

```

举报信息VO

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||举报ID|
|userId|integer(int64)|false|none||举报用户ID|
|reportedContentId|integer(int64)|false|none||被举报内容ID|
|reportedTypeId|integer(int64)|false|none||举报对象类型ID|
|reportTypeId|integer(int64)|false|none||举报类型ID|
|reason|string|false|none||举报理由|
|reportTime|string(date-time)|false|none||举报时间|
|status|integer(int32)|false|none||处理状态(0:待处理 1:正在处理 2:已处理 3:无需处理)|
|outcome|integer(int32)|false|none||处理结果(0:无行动 1:内容已删除 2:警告用户 3:用户禁言 4:用户封禁)|
|isDeleted|integer(int32)|false|none||是否删除(1:已删除 0:未删除)|
|username|string|false|none||举报用户名|
|reportedTypeName|string|false|none||举报对象类型名称|
|reportTypeName|string|false|none||举报类型名称|
|reportedContent|string|false|none||被举报内容|

<h2 id="tocS_RespReportVO">RespReportVO</h2>

<a id="schemarespreportvo"></a>
<a id="schema_RespReportVO"></a>
<a id="tocSrespreportvo"></a>
<a id="tocsrespreportvo"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "userId": 0,
    "reportedContentId": 0,
    "reportedTypeId": 0,
    "reportTypeId": 0,
    "reason": "string",
    "reportTime": "2019-08-24T14:15:22Z",
    "status": 0,
    "outcome": 0,
    "isDeleted": 0,
    "username": "string",
    "reportedTypeName": "string",
    "reportTypeName": "string",
    "reportedContent": "string"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[ReportVO](#schemareportvo)|false|none||举报信息VO|

<h2 id="tocS_PageReportVO">PageReportVO</h2>

<a id="schemapagereportvo"></a>
<a id="schema_PageReportVO"></a>
<a id="tocSpagereportvo"></a>
<a id="tocspagereportvo"></a>

```json
{
  "records": [
    {
      "id": 0,
      "userId": 0,
      "reportedContentId": 0,
      "reportedTypeId": 0,
      "reportTypeId": 0,
      "reason": "string",
      "reportTime": "2019-08-24T14:15:22Z",
      "status": 0,
      "outcome": 0,
      "isDeleted": 0,
      "username": "string",
      "reportedTypeName": "string",
      "reportTypeName": "string",
      "reportedContent": "string"
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "reportedContentId": 0,
        "reportedTypeId": 0,
        "reportTypeId": 0,
        "reason": "string",
        "reportTime": "2019-08-24T14:15:22Z",
        "status": 0,
        "outcome": 0,
        "isDeleted": 0,
        "username": "string",
        "reportedTypeName": "string",
        "reportTypeName": "string",
        "reportedContent": "string"
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "reportedContentId": 0,
          "reportedTypeId": 0,
          "reportTypeId": 0,
          "reason": "string",
          "reportTime": "2019-08-24T14:15:22Z",
          "status": 0,
          "outcome": 0,
          "isDeleted": 0,
          "username": "string",
          "reportedTypeName": "string",
          "reportTypeName": "string",
          "reportedContent": "string"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "reportedContentId": 0,
          "reportedTypeId": 0,
          "reportTypeId": 0,
          "reason": "string",
          "reportTime": "2019-08-24T14:15:22Z",
          "status": 0,
          "outcome": 0,
          "isDeleted": 0,
          "username": "string",
          "reportedTypeName": "string",
          "reportTypeName": "string",
          "reportedContent": "string"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "reportedContentId": 0,
        "reportedTypeId": 0,
        "reportTypeId": 0,
        "reason": "string",
        "reportTime": "2019-08-24T14:15:22Z",
        "status": 0,
        "outcome": 0,
        "isDeleted": 0,
        "username": "string",
        "reportedTypeName": "string",
        "reportTypeName": "string",
        "reportedContent": "string"
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "reportedContentId": 0,
          "reportedTypeId": 0,
          "reportTypeId": 0,
          "reason": "string",
          "reportTime": "2019-08-24T14:15:22Z",
          "status": 0,
          "outcome": 0,
          "isDeleted": 0,
          "username": "string",
          "reportedTypeName": "string",
          "reportTypeName": "string",
          "reportedContent": "string"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "reportedContentId": 0,
          "reportedTypeId": 0,
          "reportTypeId": 0,
          "reason": "string",
          "reportTime": "2019-08-24T14:15:22Z",
          "status": 0,
          "outcome": 0,
          "isDeleted": 0,
          "username": "string",
          "reportedTypeName": "string",
          "reportTypeName": "string",
          "reportedContent": "string"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[ReportVO](#schemareportvo)]|false|none||[举报信息VO]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageReportVO](#schemapagereportvo)|false|none||none|
|searchCount|[PageReportVO](#schemapagereportvo)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageReportVO">RespPageReportVO</h2>

<a id="schemaresppagereportvo"></a>
<a id="schema_RespPageReportVO"></a>
<a id="tocSresppagereportvo"></a>
<a id="tocsresppagereportvo"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "userId": 0,
        "reportedContentId": 0,
        "reportedTypeId": 0,
        "reportTypeId": 0,
        "reason": "string",
        "reportTime": "2019-08-24T14:15:22Z",
        "status": 0,
        "outcome": 0,
        "isDeleted": 0,
        "username": "string",
        "reportedTypeName": "string",
        "reportTypeName": "string",
        "reportedContent": "string"
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "reportedContentId": 0,
          "reportedTypeId": 0,
          "reportTypeId": 0,
          "reason": "string",
          "reportTime": "2019-08-24T14:15:22Z",
          "status": 0,
          "outcome": 0,
          "isDeleted": 0,
          "username": "string",
          "reportedTypeName": "string",
          "reportTypeName": "string",
          "reportedContent": "string"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "userId": 0,
          "reportedContentId": 0,
          "reportedTypeId": 0,
          "reportTypeId": 0,
          "reason": "string",
          "reportTime": "2019-08-24T14:15:22Z",
          "status": 0,
          "outcome": 0,
          "isDeleted": 0,
          "username": "string",
          "reportedTypeName": "string",
          "reportTypeName": "string",
          "reportedContent": "string"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageReportVO](#schemapagereportvo)|false|none||none|

<h2 id="tocS_RespReviewManageVO">RespReviewManageVO</h2>

<a id="schemarespreviewmanagevo"></a>
<a id="schema_RespReviewManageVO"></a>
<a id="tocSrespreviewmanagevo"></a>
<a id="tocsrespreviewmanagevo"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "targetId": 0,
    "type": 0,
    "status": 0,
    "title": "string",
    "content": "string",
    "reason": "string",
    "handlerId": 0,
    "handlerName": "string",
    "handleTime": "2019-08-24T14:15:22Z",
    "createTime": "2019-08-24T14:15:22Z",
    "updateTime": "2019-08-24T14:15:22Z"
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[ReviewManageVO](#schemareviewmanagevo)|false|none||审核管理VO|

<h2 id="tocS_ReviewManageVO">ReviewManageVO</h2>

<a id="schemareviewmanagevo"></a>
<a id="schema_ReviewManageVO"></a>
<a id="tocSreviewmanagevo"></a>
<a id="tocsreviewmanagevo"></a>

```json
{
  "id": 0,
  "targetId": 0,
  "type": 0,
  "status": 0,
  "title": "string",
  "content": "string",
  "reason": "string",
  "handlerId": 0,
  "handlerName": "string",
  "handleTime": "2019-08-24T14:15:22Z",
  "createTime": "2019-08-24T14:15:22Z",
  "updateTime": "2019-08-24T14:15:22Z"
}

```

审核管理VO

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||审核记录ID|
|targetId|integer(int64)|false|none||审核对象ID|
|type|integer(int32)|false|none||审核类型：1-帖子 2-用户 3-合集 4-收藏夹|
|status|integer(int32)|false|none||审核状态：0-待处理 1-通过 2-拒绝|
|title|string|false|none||审核对象标题|
|content|string|false|none||审核对象内容|
|reason|string|false|none||处理原因|
|handlerId|integer(int64)|false|none||处理人ID|
|handlerName|string|false|none||处理人名称|
|handleTime|string(date-time)|false|none||处理时间|
|createTime|string(date-time)|false|none||创建时间|
|updateTime|string(date-time)|false|none||更新时间|

<h2 id="tocS_PageReviewManageVO">PageReviewManageVO</h2>

<a id="schemapagereviewmanagevo"></a>
<a id="schema_PageReviewManageVO"></a>
<a id="tocSpagereviewmanagevo"></a>
<a id="tocspagereviewmanagevo"></a>

```json
{
  "records": [
    {
      "id": 0,
      "targetId": 0,
      "type": 0,
      "status": 0,
      "title": "string",
      "content": "string",
      "reason": "string",
      "handlerId": 0,
      "handlerName": "string",
      "handleTime": "2019-08-24T14:15:22Z",
      "createTime": "2019-08-24T14:15:22Z",
      "updateTime": "2019-08-24T14:15:22Z"
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "targetId": 0,
        "type": 0,
        "status": 0,
        "title": "string",
        "content": "string",
        "reason": "string",
        "handlerId": 0,
        "handlerName": "string",
        "handleTime": "2019-08-24T14:15:22Z",
        "createTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z"
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "targetId": 0,
          "type": 0,
          "status": 0,
          "title": "string",
          "content": "string",
          "reason": "string",
          "handlerId": 0,
          "handlerName": "string",
          "handleTime": "2019-08-24T14:15:22Z",
          "createTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "targetId": 0,
          "type": 0,
          "status": 0,
          "title": "string",
          "content": "string",
          "reason": "string",
          "handlerId": 0,
          "handlerName": "string",
          "handleTime": "2019-08-24T14:15:22Z",
          "createTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "targetId": 0,
        "type": 0,
        "status": 0,
        "title": "string",
        "content": "string",
        "reason": "string",
        "handlerId": 0,
        "handlerName": "string",
        "handleTime": "2019-08-24T14:15:22Z",
        "createTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z"
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "targetId": 0,
          "type": 0,
          "status": 0,
          "title": "string",
          "content": "string",
          "reason": "string",
          "handlerId": 0,
          "handlerName": "string",
          "handleTime": "2019-08-24T14:15:22Z",
          "createTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "targetId": 0,
          "type": 0,
          "status": 0,
          "title": "string",
          "content": "string",
          "reason": "string",
          "handlerId": 0,
          "handlerName": "string",
          "handleTime": "2019-08-24T14:15:22Z",
          "createTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[ReviewManageVO](#schemareviewmanagevo)]|false|none||[审核管理VO]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageReviewManageVO](#schemapagereviewmanagevo)|false|none||none|
|searchCount|[PageReviewManageVO](#schemapagereviewmanagevo)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageReviewManageVO">RespPageReviewManageVO</h2>

<a id="schemaresppagereviewmanagevo"></a>
<a id="schema_RespPageReviewManageVO"></a>
<a id="tocSresppagereviewmanagevo"></a>
<a id="tocsresppagereviewmanagevo"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "targetId": 0,
        "type": 0,
        "status": 0,
        "title": "string",
        "content": "string",
        "reason": "string",
        "handlerId": 0,
        "handlerName": "string",
        "handleTime": "2019-08-24T14:15:22Z",
        "createTime": "2019-08-24T14:15:22Z",
        "updateTime": "2019-08-24T14:15:22Z"
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "targetId": 0,
          "type": 0,
          "status": 0,
          "title": "string",
          "content": "string",
          "reason": "string",
          "handlerId": 0,
          "handlerName": "string",
          "handleTime": "2019-08-24T14:15:22Z",
          "createTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "targetId": 0,
          "type": 0,
          "status": 0,
          "title": "string",
          "content": "string",
          "reason": "string",
          "handlerId": 0,
          "handlerName": "string",
          "handleTime": "2019-08-24T14:15:22Z",
          "createTime": "2019-08-24T14:15:22Z",
          "updateTime": "2019-08-24T14:15:22Z"
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageReviewManageVO](#schemapagereviewmanagevo)|false|none||none|

<h2 id="tocS_AdminCommentDTO">AdminCommentDTO</h2>

<a id="schemaadmincommentdto"></a>
<a id="schema_AdminCommentDTO"></a>
<a id="tocSadmincommentdto"></a>
<a id="tocsadmincommentdto"></a>

```json
{
  "id": 0,
  "content": "string",
  "commenterId": 0,
  "commenterName": "string",
  "commenterAvatar": "string",
  "commentableId": 0,
  "commentableType": 0,
  "commentableTitle": "string",
  "parentCommentId": 0,
  "replyToCommenterId": 0,
  "replyToCommenterName": "string",
  "creationTime": "2019-08-24T14:15:22Z",
  "likeCount": 0,
  "replyCount": 0,
  "isPublic": 0,
  "isDeleted": 0,
  "reviewStatus": 0
}

```

管理员评论信息

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|id|integer(int64)|false|none||评论ID|
|content|string|false|none||评论内容|
|commenterId|integer(int64)|false|none||评论者ID|
|commenterName|string|false|none||评论者用户名|
|commenterAvatar|string|false|none||评论者头像|
|commentableId|integer(int64)|false|none||被评论对象ID|
|commentableType|integer(int32)|false|none||被评论对象类型(1:帖子 2:合集 3:评论)|
|commentableTitle|string|false|none||被评论对象标题|
|parentCommentId|integer(int64)|false|none||父评论ID|
|replyToCommenterId|integer(int64)|false|none||被回复者ID|
|replyToCommenterName|string|false|none||被回复者名称|
|creationTime|string(date-time)|false|none||创建时间|
|likeCount|integer(int32)|false|none||点赞数|
|replyCount|integer(int32)|false|none||回复数|
|isPublic|integer(int32)|false|none||是否公开(0:私密 1:公开)|
|isDeleted|integer(int32)|false|none||是否删除(0:未删除 1:已删除)|
|reviewStatus|integer(int32)|false|none||审核状态(0:待审核 1:已通过 2:已拒绝)|

<h2 id="tocS_RespAdminCommentDTO">RespAdminCommentDTO</h2>

<a id="schemarespadmincommentdto"></a>
<a id="schema_RespAdminCommentDTO"></a>
<a id="tocSrespadmincommentdto"></a>
<a id="tocsrespadmincommentdto"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "id": 0,
    "content": "string",
    "commenterId": 0,
    "commenterName": "string",
    "commenterAvatar": "string",
    "commentableId": 0,
    "commentableType": 0,
    "commentableTitle": "string",
    "parentCommentId": 0,
    "replyToCommenterId": 0,
    "replyToCommenterName": "string",
    "creationTime": "2019-08-24T14:15:22Z",
    "likeCount": 0,
    "replyCount": 0,
    "isPublic": 0,
    "isDeleted": 0,
    "reviewStatus": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[AdminCommentDTO](#schemaadmincommentdto)|false|none||管理员评论信息|

<h2 id="tocS_PageAdminCommentDTO">PageAdminCommentDTO</h2>

<a id="schemapageadmincommentdto"></a>
<a id="schema_PageAdminCommentDTO"></a>
<a id="tocSpageadmincommentdto"></a>
<a id="tocspageadmincommentdto"></a>

```json
{
  "records": [
    {
      "id": 0,
      "content": "string",
      "commenterId": 0,
      "commenterName": "string",
      "commenterAvatar": "string",
      "commentableId": 0,
      "commentableType": 0,
      "commentableTitle": "string",
      "parentCommentId": 0,
      "replyToCommenterId": 0,
      "replyToCommenterName": "string",
      "creationTime": "2019-08-24T14:15:22Z",
      "likeCount": 0,
      "replyCount": 0,
      "isPublic": 0,
      "isDeleted": 0,
      "reviewStatus": 0
    }
  ],
  "total": 0,
  "size": 0,
  "current": 0,
  "orders": [
    {
      "column": "string",
      "asc": true
    }
  ],
  "optimizeCountSql": {
    "records": [
      {
        "id": 0,
        "content": "string",
        "commenterId": 0,
        "commenterName": "string",
        "commenterAvatar": "string",
        "commentableId": 0,
        "commentableType": 0,
        "commentableTitle": "string",
        "parentCommentId": 0,
        "replyToCommenterId": 0,
        "replyToCommenterName": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "likeCount": 0,
        "replyCount": 0,
        "isPublic": 0,
        "isDeleted": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "content": "string",
          "commenterId": 0,
          "commenterName": "string",
          "commenterAvatar": "string",
          "commentableId": 0,
          "commentableType": 0,
          "commentableTitle": "string",
          "parentCommentId": 0,
          "replyToCommenterId": 0,
          "replyToCommenterName": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "likeCount": 0,
          "replyCount": 0,
          "isPublic": 0,
          "isDeleted": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "content": "string",
          "commenterId": 0,
          "commenterName": "string",
          "commenterAvatar": "string",
          "commentableId": 0,
          "commentableType": 0,
          "commentableTitle": "string",
          "parentCommentId": 0,
          "replyToCommenterId": 0,
          "replyToCommenterName": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "likeCount": 0,
          "replyCount": 0,
          "isPublic": 0,
          "isDeleted": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "searchCount": {
    "records": [
      {
        "id": 0,
        "content": "string",
        "commenterId": 0,
        "commenterName": "string",
        "commenterAvatar": "string",
        "commentableId": 0,
        "commentableType": 0,
        "commentableTitle": "string",
        "parentCommentId": 0,
        "replyToCommenterId": 0,
        "replyToCommenterName": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "likeCount": 0,
        "replyCount": 0,
        "isPublic": 0,
        "isDeleted": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "content": "string",
          "commenterId": 0,
          "commenterName": "string",
          "commenterAvatar": "string",
          "commentableId": 0,
          "commentableType": 0,
          "commentableTitle": "string",
          "parentCommentId": 0,
          "replyToCommenterId": 0,
          "replyToCommenterName": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "likeCount": 0,
          "replyCount": 0,
          "isPublic": 0,
          "isDeleted": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "content": "string",
          "commenterId": 0,
          "commenterName": "string",
          "commenterAvatar": "string",
          "commentableId": 0,
          "commentableType": 0,
          "commentableTitle": "string",
          "parentCommentId": 0,
          "replyToCommenterId": 0,
          "replyToCommenterName": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "likeCount": 0,
          "replyCount": 0,
          "isPublic": 0,
          "isDeleted": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  },
  "optimizeJoinOfCountSql": true,
  "maxLimit": 0,
  "countId": "string",
  "pages": 0
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|records|[[AdminCommentDTO](#schemaadmincommentdto)]|false|none||[管理员评论信息]|
|total|integer(int64)|false|none||none|
|size|integer(int64)|false|none||none|
|current|integer(int64)|false|none||none|
|orders|[[OrderItem](#schemaorderitem)]|false|write-only||none|
|optimizeCountSql|[PageAdminCommentDTO](#schemapageadmincommentdto)|false|none||none|
|searchCount|[PageAdminCommentDTO](#schemapageadmincommentdto)|false|none||none|
|optimizeJoinOfCountSql|boolean|false|write-only||none|
|maxLimit|integer(int64)|false|write-only||none|
|countId|string|false|write-only||none|
|pages|integer(int64)|false|none||none|

<h2 id="tocS_RespPageAdminCommentDTO">RespPageAdminCommentDTO</h2>

<a id="schemaresppageadmincommentdto"></a>
<a id="schema_RespPageAdminCommentDTO"></a>
<a id="tocSresppageadmincommentdto"></a>
<a id="tocsresppageadmincommentdto"></a>

```json
{
  "code": 0,
  "msg": "string",
  "data": {
    "records": [
      {
        "id": 0,
        "content": "string",
        "commenterId": 0,
        "commenterName": "string",
        "commenterAvatar": "string",
        "commentableId": 0,
        "commentableType": 0,
        "commentableTitle": "string",
        "parentCommentId": 0,
        "replyToCommenterId": 0,
        "replyToCommenterName": "string",
        "creationTime": "2019-08-24T14:15:22Z",
        "likeCount": 0,
        "replyCount": 0,
        "isPublic": 0,
        "isDeleted": 0,
        "reviewStatus": 0
      }
    ],
    "total": 0,
    "size": 0,
    "current": 0,
    "orders": [
      {
        "column": "string",
        "asc": true
      }
    ],
    "optimizeCountSql": {
      "records": [
        {
          "id": 0,
          "content": "string",
          "commenterId": 0,
          "commenterName": "string",
          "commenterAvatar": "string",
          "commentableId": 0,
          "commentableType": 0,
          "commentableTitle": "string",
          "parentCommentId": 0,
          "replyToCommenterId": 0,
          "replyToCommenterName": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "likeCount": 0,
          "replyCount": 0,
          "isPublic": 0,
          "isDeleted": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "searchCount": {
      "records": [
        {
          "id": 0,
          "content": "string",
          "commenterId": 0,
          "commenterName": "string",
          "commenterAvatar": "string",
          "commentableId": 0,
          "commentableType": 0,
          "commentableTitle": "string",
          "parentCommentId": 0,
          "replyToCommenterId": 0,
          "replyToCommenterName": "string",
          "creationTime": "2019-08-24T14:15:22Z",
          "likeCount": 0,
          "replyCount": 0,
          "isPublic": 0,
          "isDeleted": 0,
          "reviewStatus": 0
        }
      ],
      "total": 0,
      "size": 0,
      "current": 0,
      "orders": [
        {
          "column": "string",
          "asc": true
        }
      ],
      "optimizeCountSql": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "searchCount": {
        "records": [
          {}
        ],
        "total": 0,
        "size": 0,
        "current": 0,
        "orders": [
          {}
        ],
        "optimizeCountSql": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "searchCount": {
          "records": null,
          "total": null,
          "size": null,
          "current": null,
          "orders": null,
          "optimizeCountSql": null,
          "searchCount": null,
          "optimizeJoinOfCountSql": null,
          "maxLimit": null,
          "countId": null,
          "pages": null
        },
        "optimizeJoinOfCountSql": true,
        "maxLimit": 0,
        "countId": "string",
        "pages": 0
      },
      "optimizeJoinOfCountSql": true,
      "maxLimit": 0,
      "countId": "string",
      "pages": 0
    },
    "optimizeJoinOfCountSql": true,
    "maxLimit": 0,
    "countId": "string",
    "pages": 0
  }
}

```

### 属性

|名称|类型|必选|约束|中文名|说明|
|---|---|---|---|---|---|
|code|integer(int32)|false|none||none|
|msg|string|false|none||none|
|data|[PageAdminCommentDTO](#schemapageadmincommentdto)|false|none||none|

