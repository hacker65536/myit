# SLO CHEAT SHEET

https://kstatic.googleusercontent.com/files/ff59978bff9a5b5cc58a4d86d7fbdc783e1038513f75e2a2b0016467363272e2eeb25a122e2c3f69f624df049e49fae83f07af834f21cedf57c37ef2fbdbbb61

## Terminology

- MTTD (Mean Time To Detection)
  - 平均検出時間
  - MTTD =障害と検出の間の合計時間/障害の数 
- MTTR (Mean Time To Resolution)
  - 解決までの平均時間
  - MTTR（回復）=検出と修復に費やされた合計時間/修復の数
  - MTTR（修理）=修理に費やされた合計時間/修理の数
- MTBF (Mean Time Between Failures)
  - 平均故障間隔
  - MTBF =デバイス全体の総寿命/障害数
- MTTF (Mean Time to Failure)
  - 平均故障間隔
  - MTTF=デバイス全体の総寿命/デバイスの数
  - 壊れた場合置き換えられる

## Reliability

システムでもっとも重要な性質は信頼性である。ユーザの期待通りに機能していればそのサービスは信頼されていると言える。
十分な信頼性


十分な信頼性。信頼性の低さを許容できる量と認識することで、新機能の開発や立ち上げに費やすことができる失敗のための予算を提供する。

信頼性を向上させるために、以下を削減する。
検出までの時間｜解決までの時間｜停止の影響｜停止の頻度。
十分な信頼性。信頼性の低さを許容できる量と認識することで、新機能の開発や立ち上げに費やすことができる失敗のための予算を提供する。

信頼性を向上させるために、以下を削減する。
検出までの時間｜解決までの時間｜停止の影響｜停止の頻度。

## Happiness test
サービスには、かろうじて満たされたとしても、一般的な顧客が満足するようなパフォーマンスと可用性のレベルを把握するSLO目標が必要です。

## SLA
結果を伴う外部向け契約。SLAは提供するサービスの最低レベルと、そうでない場合にどうなるかを記載されている。
## SLI
ユーザーから見たサービスの信頼性を数値化したもの。
良いSLIは、ユーザーの幸せの測定可能なアナロジーです。
SLIメニューは、あるCUJ(customer user journey)を測定する際に使用できるSLIの種類のガイドラインを提供します。
### SLI Menu  
ユーザージャーニーにおける
- request/response
  - インタラクションの信頼性を追跡するために、可用性、レイテンシー、品質を測定します。
- データ処理
  - 鮮度、網羅性、正確性、スループット。
- ストレージの場合
  - スループットとレイテンシー。
## SLO
一定期間のSLIのターゲットを設定します。
SLOは、信頼性と他の機能との間で優先順位をつけ、客観的なデータによってサービスに対する期待値を伝えるための基本的なツールである。
SLO は、お客様の期待に応えるための社内約束事です。
SLO を逸脱した場合、信頼性向上に向けた技術的な努力の方向性を定める必要があります。
## Error budget
SLOは、許容可能なレベルの信頼性の低さを意味する。この許容可能な故障率は、新機能のリリース、設定変更、A/Bテストなどのリスクの高い開発活動に、サービスのダウンタイムで消費されなければ、積極的に使える予算となります。
## Setting SLOs and SLIs
SLIは一貫したフォーマットで、0～100%の範囲で設定する。

### SLIの計算式**

SLI= (good events / vaild events ) * 100%

有効なイベントのうち、良好であったイベントの割合。


### ビジネスへの影響度を考慮した重要なユーザージャーニー

1. メニューから SLI の仕様を選択
2. SLI の詳細な実装を指定する
3. カバレッジギャップがないことを検証する
4. 過去の実績やビジネス上の必要性に基づいてSLOを設定する

ユーザージャーニーごとに3～5個のSLIを選択する

SLIの実施には、イベント＋成功基準＋SLIを記録する場所／方法が含まれる必要がある
SLO には、ターゲットと測定ウィンドウを含める必要がある


### SLIの測定に利用するソース
- ログ処理
- アプリケーションサーバのメトリクス
- フロントエンド基盤のメトリクス
- 外部監視
- クライアントツール

## outage math


|       | 99%  | 99.5% | 99.9% | 99.95% | 99.99% | 99.999% |
|-------|------|-------|-------|--------|--------|---------|
| 100%  | 7.2h | 3.6h  | 43.2m | 21.6m  | 4.32m  | 25.9s   |
| 10%   | 3d   | 7.2h  | 7.2h  | 3.6h   | 43.2m  | 4.32m   |
| 1%    |      | 15d   | 3d    | 36h    | 7.2h   | 43.2m   |
| 0.1%  |      |       |       | 15d    | 3d     | 7.2h    |
| 0.05% |      |       |       |        | 6d     | 14.4h   |
