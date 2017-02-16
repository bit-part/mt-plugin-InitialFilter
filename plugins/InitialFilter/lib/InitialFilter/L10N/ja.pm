package InitialFilter::L10N::ja;

use strict;
use base 'InitialFilter::L10N::en_us';
use vars qw( %Lexicon );

## The following is the translation table.

%Lexicon = (

    # config.yaml
    'bit part LLC' => 'bit part 合同会社',
    'Set an initial filter to a list page built Listing Framework.' =>
        'リスティングフレームワークを利用した一覧ページに初期フィルタを設定します。',
    'Set with YAML format' => 'YAMLで設定してください。',
    'Setting information'  => '設定内容',
    'The value of "_type" parameter' =>
        '一覧ページのURLの "_type" パラメータの値',
    'Filter ID' => 'フィルタのid',
    'Set 1 if you always wont to set the initial filter' =>
        '一覧ページを表示した時に常にここで指定したフィルタを適用させたい場合は1',
    'Setting Sample' => '記事一覧への設定サンプル',
    'If the URL is "mt.cgi?__mode=list&_type=entry&blog_id=2"' =>
        'URL が mt.cgi?__mode=list&_type=entry&blog_id=2 の場合',
);

1;
