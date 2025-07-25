## マインクラフトのデータパックで作られた、
# マインクラフト内で、ノックバックをコマンドで再現しているライブラリです。
### 製作者:reizou_00
## 対応バージョンは以下の通りです。
1.21.4(以外でも動くかもしれないが確認していない。)
## ※注意事項
reizo_KnockBack_lib.AttackerというTagを攻撃者につけないと動かない。

## 使い方。
### 実行者を吹っ飛ばす方法です。
### PlayerでもMobでも、どちらも行けます！

### ※実行者(ノックバックを食らうエンティティ)は必ずreizo_KnockBack_lib.Attackerタグをつけないようにしてください！おかしくなります！

```mcfunction
/execute as <対象> at @s run function #reizo_knokback_lib:_
```

## License

This project is released under the CC0 1.0 Universal license.

[![CC0](https://licensebuttons.net/p/zero/1.0/88x31.png)](https://creativecommons.org/publicdomain/zero/1.0/)

要するにこれは「著作権なしだよ～」ってこと。