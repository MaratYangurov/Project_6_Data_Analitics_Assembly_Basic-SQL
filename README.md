# Project_6_Data_Analitics_Assembly_Basic SQL

# Анализ рынка инвестиций

## Описание проекта

В этом проекте необходимо проанализировать данные о фондах и инвестициях и написать запросы к базе.

База данных хранит информацию о венчурных фондах и инвестициях в компании-стартапы. Эта база данных основана на датасете _Startup Investments_, опубликованном на платформе [Kaggle](https://www.kaggle.com/datasets/justinas/startup-investments).


## Основные термины

_Венчурные фонды_ — это финансовые организации, которые могут позволить себе высокий риск и инвестировать в компании с инновационной бизнес-идеей или разработанной новой технологией, т. е. в стартапы. Цель венчурных фондов — в будущем получить значительную прибыль, которая в разы превысит размер их трат на инвестиции в компанию. Если стартап подорожает, венчурный фонд может получить долю в компании или фиксированный процент от её выручки.

Чтобы процесс финансирования стал менее рискованным, его делят на стадии — раунды. Тот или иной раунд зависит от того, какого уровня развития достигла компания. 

_Первые этапы_ — предпосевной и посевной раунды. _Предпосевной_ раунд предполагает, что компания как таковая ещё не создана и находится в стадии замысла. Следующий — _посевной_ — раунд знаменует рост проекта: создатели компании разрабатывают бизнес-модель и привлекают инвесторов.

Если компании требуется ментор или наставник — она привлекает бизнес-ангела.

_Бизнес-ангелы_ — инвесторы, которые помимо финансовой поддержки предлагают экспертную помощь. Такой раунд называют ангельским.

Когда стартап становится компанией с проверенной бизнес-моделью и начинает зарабатывать самостоятельно, предложений инвесторов становится больше. Это раунд A, а за ним следуют и другие: B, C, D — на этих этапах компания активно развивается и готовится к **IPO**.
 
Иногда выделяют _венчурный раунд_ — финансирование, которое могло поступить от венчурного фонда на любом этапе: начальном или более позднем.

## Схема базы данных

![ER-диаграмма](https://github.com/danspers/14.DA-investment-market/raw/main/ER_diagram.png)

**acquisition**

Содержит информацию о покупках одних компаний другими.

Таблица включает такие поля:

• первичный ключ id — идентификатор или уникальный номер покупки;

• внешний ключ acquiring_company_id — ссылается на таблицу company — идентификатор компании-покупателя, то есть той, что покупает другую компанию;

• внешний ключ acquired_company_id — ссылается на таблицу company — идентификатор компании, которую покупают;

• term_code — способ оплаты сделки:
cash — наличными;
stock — акциями компании;
cash_and_stock — смешанный тип оплаты: наличные и акции.

• price_amount — сумма покупки в долларах;

• acquired_at — дата совершения сделки;

• created_at — дата и время создания записи в таблице;

• updated_at — дата и время обновления записи в таблице.

**company**

Содержит информацию о компаниях-стартапах.

• первичный ключ id — идентификатор, или уникальный номер компании;

• name — название компании;

• category_code — категория деятельности компании, например:
news — специализируется на работе с новостями;
social — специализируется на социальной работе.

• status — статус компании:
acquired — приобретена;
operating — действует;
ipo — вышла на IPO;
closed — перестала существовать.

• founded_at — дата основания компании;

• closed_at — дата закрытия компании, которую указывают в том случае, если компании больше не существует;

• domain — домен сайта компании;

• network_username — профиль фонда в корпоративной сети биржи;

• country_code — код страны, например, USA для США, GBR для Великобритании;

• investment_rounds — число раундов, в которых компания участвовала как инвестор;

• funding_rounds — число раундов, в которых компания привлекала инвестиции;

• funding_total — сумма привлечённых инвестиций в долларах;

• milestones — количество важных этапов в истории компании;

• created_at — дата и время создания записи в таблице;

• updated_at — дата и время обновления записи в таблице.

**education**

Хранит информацию об уровне образования сотрудников компаний.

• первичный ключ id — уникальный номер записи с информацией об образовании;

• внешний ключ person_id — ссылается на таблицу people — идентификатор человека, информация о котором представлена в записи;

• degree_type — учебная степень, например:
BA — Bachelor of Arts — бакалавр гуманитарных наук;
MS — Master of Science — магистр естественных наук.

• instituition — учебное заведение, название университета;

• graduated_at — дата завершения обучения, выпуска;

• created_at — дата и время создания записи в таблице;

• updated_at — дата и время обновления записи в таблице.

**fund**

Хранит информацию о венчурных фондах. 

• первичный ключ id — уникальный номер венчурного фонда;

• name — название венчурного фонда;

• founded_at — дата основания фонда;

• domain — домен сайта фонда;

• network_username — профиль фонда в корпоративной сети биржи;

• country_code — код страны фонда;

• investment_rounds — число инвестиционных раундов, в которых фонд принимал участие;

• invested_companies — число компаний, в которые инвестировал фонд;

• milestones — количество важных этапов в истории фонда;

• created_at — дата и время создания записи в таблице;

• updated_at — дата и время обновления записи в таблице.

**funding_round**

Содержит информацию о раундах инвестиций. 

• первичный ключ id — уникальный номер инвестиционного раунда;

• внешний ключ company_id — ссылается на таблицу company — уникальный номер компании, участвовавшей в инвестиционном раунде;

• funded_at — дата проведения раунда;

• funding_round_type — тип инвестиционного раунда, например:
venture — венчурный раунд;
angel — ангельский раунд;
series_a — раунд А.

• raised_amount — сумма инвестиций, которую привлекла компания в этом раунде в долларах;

• pre_money_valuation — предварительная, проведённая до инвестиций оценка стоимости компании в долларах;

• participants — количество участников инвестиционного раунда;

• is_first_round — является ли этот раунд первым для компании;

• is_last_round — является ли этот раунд последним для компании;

• created_at — дата и время создания записи в таблице;

• updated_at — дата и время обновления записи в таблице.

**investment**

Содержит информацию об инвестициях венчурных фондов в компании-стартапы.

• первичный ключ id — уникальный номер инвестиции;

• внешний ключ funding_round_id — ссылается на таблицу funding_round — уникальный номер раунда инвестиции;

• внешний ключ company_id — ссылается на таблицу company — уникальный номер компании-стартапа, в которую инвестируют;

• внешний ключ fund_id — ссылается на таблицу fund — уникальный номер фонда, инвестирующего в компанию-стартап;

• created_at — дата и время создания записи в таблице;

• updated_at — дата и время обновления записи в таблице.

**people**

Содержит информацию о сотрудниках компаний-стартапов.

• первичный ключ id — уникальный номер сотрудника;

• first_name — имя сотрудника;

• last_name — фамилия сотрудника;

• внешний ключ company_id — ссылается на таблицу company — уникальный номер компании-стартапа;

• network_username — профиль фонда в корпоративной сети биржи;

• created_at — дата и время создания записи в таблице;

• updated_at — дата и время обновления записи в таблице.