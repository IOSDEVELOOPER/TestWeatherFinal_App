# TestWeatherFinal_App
Тестовое задание : Создание упрощенной версии приложения погоды, используя открытое API

Стэк технологий: SwiftUI, MVVM, CoreData, Combine, iOS SDK.

Выбор архитектуры вполне логчино вытекает из выбора фреймворка для верстки - SwiftUI. Так как он помогает очень хорошо разделять "подготовку View" от самого View, то был выбран соответсвующий паттерн

Так как в описании тз была указана работа с внещним API, то сразу же к трем базовым каталогам добавился и каталог Service, в котором было описано сетевое взаимодейтсвие и также в отдельный файл этого каталога я принял решение вынести сервис по обработке местоположения пользователя.

Далее была сделана некоторая подготовительная работа в виде расширений для цветов для более удобной работы с цветами в дальнейшем при масштабировании проекта.

Говоря о наиболее видимой части приложения - Views, внутри этого каталога было создано ешё два для визуально более приятной и понятной работе в дальнейшем. Два главных окна: Main и WeekList.

В каталоге Main был сделан подкаталог HelpViews для описания вспомогательных View и усовершенствования интерфейса в дальнейшем (туда был вложен кастомный TabBar)

Далее ViewModel, которая отвечает за то, какое наполнение имеет экран. Было принято решение не разделять ViewModel на две, что надо делать по хорошему, так как второй экран имеет ну уж очень незамысловатую логику, поэтому лишнее нагромождение тоже не есть хорошо.

Так как в приложение есть два вида запросов - есть два вида модели, которые реализованы в каталоге Models посредством кодогенерации в специальном конверторе из JSON -> Swift.

Для хранения информации при отсутсвии интернета использовлся фреймворк CoreData. Был создан каталог Managers. И там создан CoreDataManager.

Код имеет достаточное количество комментариев, но не перенагружен ими.