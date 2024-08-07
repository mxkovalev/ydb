# Топология кластера {{ ydb-short-name }}

Кластер {{ ydb-short-name }} состоит из статических и динамических узлов:

* статические узлы обеспечивают хранение данных, реализуя одну из поддерживаемых схем избыточности в зависимости от установленного режима работы;
* динамические узлы обеспечивают выполнение запросов, координацию транзакций и другие функции управления данными.

Топология кластера определяется требованиями к отказоустойчивости. Доступны следующие режимы работы:

Режим | Множитель<br/>объема хранения | Минимальное<br/>количество<br/>узлов | Описание
--- | --- | --- | ---
`none` | 1 | 1 | Избыточность отсутствует.<br/>Любой сбой оборудования приводит к недоступности пула хранения.<br/>Режим рекомендуется использовать только для функционального тестирования.
`block-4-2` | 1,5 | 8 | Применяется [Erasure coding](https://ru.wikipedia.org/wiki/Стирающий_код) с двумя блоками избыточности, добавляемыми к четырем блокам исходных данных. Узлы хранилища размещаются в не менее чем 8 доменах отказа (обычно стойках).<br/>Пул хранения доступен при потере любых двух доменов, продолжая запись всех 6 частей данных в оставшихся доменах.<br/>Режим рекомендуется для пулов хранения в пределах одной зоны доступности (обычно центра обработки данных).
`mirror-3-dc` | 3 | 9 | Данные реплицируются в 3 зоны доступности, использующие 3 домена отказа (обычно стойки) внутри каждой зоны.<br/>Пул хранения доступен при сбое одной зоны доступности и одного домена отказа в оставшихся зонах.<br/>Режим рекомендуется для мультидатацентровых инсталляций.
`mirror-3dc-3-nodes` | 3 | 3 | Является упрощенным вариантом `mirror-3dc`. Для данного режима необходимо минимум 3 сервера по 3 диска в каждом. Для обеспечения наибольшей отказоустойчивости каждый сервер должен находиться в независимом датацентре.<br/>Работоспособность в данном режиме сохраняется при выходе из строя не более 1 узла.<br/>Режим рекомендуется использовать только для функционального тестирования.

{% note info %}

Под выходом из строя узла подразумевается как полная, так и частичная его недоступность, например выход из строя одного диска на узле.

Приведенный выше множитель объема хранения относится только к фактору обеспечения отказоустойчивости. Для планирования размера хранилища необходимо учитывать другие влияющие факторы (например, фрагментацию и гранулярность слотов).

{% endnote %}

О том, как задать топологию кластера {{ ydb-short-name }} читайте в разделе [{#T}](../deploy/configuration/config.md#domains-blob).
