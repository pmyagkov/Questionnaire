window.templateData = {
    userData: [
        { text: "Резюме до 250 КБ", name: "cv", type: "file" },
        { text: "Ссылка на профиль в Моем Круге", name: "mk", type: "text" },
        { text: "Имя, Фамилия", name: "name", type: "text" },
        { text: "Телефон", name: "phone", type: "text", hint: "Пожалуйста, укажите код города." },
        { text: "Email", name: "email", type: "text", validator: { required: "Не заполнено поле \"E-mail\".", email: "Неверный адрес электронной почты." } },
        { text: "Дополнительные сведения", name: "additional", type: "textarea" },
        {
            text: "Откуда вы узнали о нашем предложении?",
            name: "recommend",
            type: "select",
            options: ["от HR-менеджера Яндекса", "Я.Субботник", "Yet another Conference", "на другой конференции",
                "из поиска", "из поиска", "другое"],
            validator: { required: "Укажите, пожалуйста, откуда вы узнали о нашем предложении." }
        },
        {
            text: "Я даю свое согласие на передачу в ООО «ЯНДЕКС» резюме и/или анкеты, содержащих мои персональные данные, и согласен с тем, что они будут храниться в ООО «ЯНДЕКС» в течение 5 лет и будут обрабатываться исключительно для целей предложения мне вакансий группы компаний «ЯНДЕКС», в соответствии с Федеральным законом «О персональных данных».",
            name: "agree",
            type: "checkbox",
            validator: { required: "Подтвердите, пожалуйста, своё согласие на передачу анкеты с вашими персональными данными." }
        }
    ],
    questions: [
        { text: "Год рождения." },
        { text: "Город, в котором вы живёте." },
        { text: "Вуз, факультет, специальность, кафедра." },
        { text: "Год окончания вуза." },
        {
            text: "Уровень владения английским язык:",
            options: [
                {
                    text: "начальный",
                    value: "beginner"
                },
                {
                    text: "средний",
                    value: "intermediate"
                },
                {
                    text: "свободное владение",
                    value: "advanced"
                }
            ]
        },
        { text: "Чего вы ожидаете от участия в Школе?" },
        { text: "Откуда вы о нас узнали?" },
        { text: "Сколько времени вы были бы готовы уделять стажировке или работе в Яндексе?" },
        { text: "Расскажите о вашем опыте разработки. Нам будет интересно всё — как серьезный интерфейс, так и просто домашняя страничка." },
        { text: "Если вы где-нибудь работали, расскажите, какие у вас были должностные обязанности и был ли опыт работы в команде." },
        { text: "Перечислите, какими программными продуктами вы пользуетесь в своей работе — от редактора до специализированных утилит (Intellij Idea, Node.js, Uglify.js, GNU Make). Для каждого инструмента укажите, какие задачи вы с помощью него решаете и почему выбрали именно его." },
        { text: "Пользуетесь ли вы командной строкой? Какими командами вы пользуетесь и какие задачи вы решаете с их помощью? С какими программами вы преимущественно или полностью взаимодействуете через интерфейс командной строки?" },
        {
            text: "Напишите на JavaScript функцию, которая выводит список всех чисел, которые равны сумме факториалов своих цифр. Пример такого числа:" +
                '<p class="b-static-text b-static-text_weight_normal">4! + 0! + 5! + 8! + 5! = 40585</p>' +
                'В качестве ответа на вопрос пришлите ссылку на <a href="http://jsfiddle.net/" class="b-link" target="_blank">http://jsfiddle.net/</a> с вашим кодом или на ваш репозиторий на <a href="https://github.com/" class="b-link" target="_blank">https://github.com/</a>.'
        },
        {
            text: "Вы — пилот грузового межгалактического корабля. Ваша работа — перевозка грузов с одной планету на другую. Грузоподъемность вашего корабля ограничена, поэтому за один рейс вы можете перевезти не более N кг полезного груза. Ваш корабль умеет сообщать свое состояние (местоположение и степень загруженности), а также летать в любую точку пространства. Каждая планета может содержать на себе груз, который можно взять. Также на каждой планете груз можно оставить." +
                "<p>Задание</p>" + "<p>Даны незавершенные интерфейсы корабля и планеты. Напишите недостающий код.</p>" + "<p>Полное условие задачи доступно на</p>" +
                '<p><a href="https://github.com/yandex-shri/introtask-space" class="b-link" target="_blank">https://github.com/yandex-shri/introtask-space</a></p>' +
                'В качестве ответа на вопрос пришлите ссылку на <a href="http://jsfiddle.net/" class="b-link" target="_blank">http://jsfiddle.net/</a> с вашим кодом или на ваш репозиторий на <a href="https://github.com" class="b-link" target="_blank">https://github.com</a>'
        },
        {
            text: "Сверстайте форму-анкету с нашими заданиями для кандидатов. Страница должна работать в следующих браузерах: MSIE (8, 9, 10), Google Chrome (26, 27), Firefox (20, 21), Opera (12.15, 12.14), Яндекс.Браузер 1.5." +
                "По возможности используйте приёмы безопасной деградации CSS. Страница должна содержать интерактив, реализованный с помощью JS и jQuery." +
                "Это может быть:" +
                '<ul class="b-list b-list_type_bullet"><li>проверка полноты и правильности заполнения полей (где это возможно);</li><li>возможность свернуть и развернуть разделы (аккордеон);</li><li>индикатор заполнения анкеты;</li><li>что-нибудь ещё.</li></ul>' +
                "<p>Подумайте над тем, как эти данные будут отправляться на сервер.</p><p> Будет плюсом, если вы сверстаете страницу, используя БЭМ.</p><p>Дополнительные задания:</p>" +
                '<ul class="b-list b-list_type_numeric">' +
                "<li>Выполните задание про форму-анкету, используя один из классических шаблонизаторов: Handlebars, mustache, Dust, Jade и т.п.</li>" +
                "<li>Выполните задание про форму-анкету, используя один из экзотических шаблонизаторов: XSLT, YATE, BEMHTML и т.п.</li></ul>" +
                '<p>Разработку необходимо вести на <a href="https://github.com/" class="b-link" target="_blank">https://github.com/</a>. В качестве ответа на вопрос пришлите ссылку на проект.</p>'
        }
    ]
};