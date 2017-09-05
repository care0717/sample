# admin console Web API 代理店管理

[操作履歴について](./README.md#操作履歴について)

-----

# 代理店管理/代理店一覧API

| path | method | 権限 | 説明 |
| ---- | ------ | --- | --- |
| /api/agency/list | GET | アカウント管理に関する権限 | 代理店の一覧を取得する |

### パラメータ

| 物理名 | 論理名 | デフォルト値 | 必須Y/N | その他バリデーション | 対応RDBカラム | 補足説明 |
| ------ | ------ | --------- | ------- | ----------------- | ------------ | ------- |
| [一覧系パラメータ](README.md#一覧系パラメータ) | | | N | | | |
| name | 代理店名称 | | N | 100文字以内 | agency.name | 部分一致 |
| accountName | アカウント名 | | N | 100文字以内 | account.name | 部分一致 |

### レスポンス

[一覧系レスポンス](README.md#一覧系レスポンス)

| 物理名 | 論理名 | 対応 RDB カラム | フォーマットなど | 説明 |
| ----- | ----- | -------------- | -------------- | --- |
| id | ID | agency.id | | |
| accountId | アカウントID | agency.account_id |  | 代理店の所属しているアカウントのID |
| accountName | アカウント名 | account.name |  | 代理店の所属しているアカウントの名前 |
| name | 代理店名 | agency.name |  |  |
| userCount | ユーザー数 |  |  | 代理店に所属しているユーザーの数、下記authority情報を参照 |
| createdAt | 作成日時 | agency.created_at | [標準DateTimeFormat](README.md#apiで利用するフォーマット) | |
| updatedAt | 更新日時 | agency.updated_at | [標準DateTimeFormat](README.md#apiで利用するフォーマット) | |
| versionNo | バージョン | agency.version_no | | |

authority情報

| 物理名 | 論理名 | 対応RDBカラム | フォーマットなど | 補足説明 |
| ------ | ----- | ----------- | ----------- | ------- |
| accountName | アカウント名 | account.name | | account_idで結合 |
| userCount | ユーザー数 |  | | AuthorityTableをagency_idでgroup_byした後にagency_idで結合、ユーザーがいなければnull |

-----

# 代理店削除API

| path | method | [権限](README.md#apiでの権限チェック) | 説明 |
| ---- | ------ | --- | --- |
| /api/agency/:id | DELETE | アカウント管理の権限（管理者）| 該当代理店を???削除する |
