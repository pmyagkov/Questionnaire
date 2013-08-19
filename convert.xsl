<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="content-type" content="text/html; charset=UTF-8"></meta>
                <link rel="icon" href="favicon.ico" type="image/x-icon"></link>
                <title>Компания Яндекс — Анкета второй Школы разработки интерфейсов в Москве</title>
                <link rel="stylesheet" href="content/style.css"></link>


                <script type="text/javascript" src="scripts/lib/jquery.min.js"></script>
                <script type="text/javascript" src="scripts/lib/jquery.form.min.js"></script>
                <script type="text/javascript" src="scripts/lib/jquery.validate.min.js"></script>
                <script type="text/javascript" src="scripts/lib/jquery.validate.unobtrusive.min.js"></script>
                <script type="text/javascript" src="scripts/custom/jquery.validate.unobtrusive.adapters.js"></script>


                <script type="text/javascript" src="scripts/lib/underscore.js"></script>
                <script type="text/javascript" src="scripts/custom/controls.js"></script>

                <script type="text/javascript" src="scripts/custom/init.js"></script>
            </head>
            <body>

                <div class="b-to-top">
                    <div class="b-to-top__button" title="Наверх">
                        <span class="b-to-top__arrow">↑</span>
                    </div>
                </div>
                <div class="b-content">
                    <div class="b-rest-questions">
                        <span class="b-rest-questions__caption">Неотвеченных вопросов:&#xA0;</span>
                        <span class="b-rest-questions__value">0</span>
                    </div>
                    <div class="b-page-title">
                        <h1 class="b-page-title__title">Анкета второй Школы разработки интерфейсов в Москве</h1>
                    </div>
                    <div class="b-static-text">
                        <p>Яндекс открывает набор во вторую Школу разработки интерфейсов в Москве.</p>
                        <p>Для поступления необходимо заполнить анкету с тестовыми заданиями. Приём заявок закрывается 19 августа в 23:59 по московскому времени. По результатам теста мы пригласим в Школу 30-40 человек.</p><p>Подробности о Школе читайте на
                        <a href="http://events.yandex.ru/shri/" class="b-link" target="_blank">этой странице</a>
                    </p>
                    </div>

                    <form method="post" action="Home/Save" enctype="multipart/form-data">
                        <div class="b-task">
                            <table class="b-task__table">
                                <tr>
                                    <td colspan="2">
                                        <div class="b-static-text">
                                            <h3>Заполните анкету</h3>
                                        </div>
                                    </td>
                                </tr>

                                <xsl:for-each select="//root/questions/question">
                                <tr>
                                    <td class="b-task__left_col">
                                        <a class="b-task__accord-pointer">
                                            <xsl:attribute name="data-question">
                                                <xsl:value-of select="@name"/>
                                            </xsl:attribute>
                                            <span class="b-task__accord-icon"><xsl:value-of select="' '"/></span>
                                            <label class="b-task__number">
                                                <em>Вопрос <xsl:value-of select="position()"/></em>
                                            </label>
                                        </a>
                                    </td>
                                    <td class="b-task__right_col">
                                        <div class="b-static-text b-static-text_weight_bold">
                                            <p><xsl:value-of select="text" disable-output-escaping="yes"/></p>
                                            <xsl:if test="count(options/option) &gt; 0">
                                                <ul class="b-options">
                                                    <xsl:for-each select="options/option">
                                                        <li>
                                                            <input type="radio">
                                                                <xsl:attribute name="name">
                                                                    <xsl:value-of select="ancestor::*[2]/@name"/>_o</xsl:attribute>
                                                                <xsl:attribute name="id">
                                                                    <xsl:value-of select="ancestor::*[2]/@name"/>_o<xsl:value-of select="position()"/>
                                                                </xsl:attribute>

                                                                <xsl:attribute name="class">
                                                                    <xsl:value-of select="ancestor::*[2]/@name"/>
                                                                </xsl:attribute>

                                                                <xsl:attribute name="data-question">
                                                                    <xsl:value-of select="ancestor::*[2]/@name"/>
                                                                </xsl:attribute>

                                                                <xsl:attribute name="value">
                                                                    <xsl:value-of select="@value"/>
                                                                </xsl:attribute>

                                                            </input>
                                                            <label>
                                                                <xsl:attribute name="for">
                                                                    <xsl:value-of select="ancestor::*[2]/@name"/>_o<xsl:value-of select="position()"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="text()"/>

                                                                <xsl:choose>
                                                                    <xsl:when test="position() - 1  &lt; count(preceding-sibling::*) + count(following-sibling::*)">;</xsl:when>
                                                                    <xsl:otherwise>.</xsl:otherwise>
                                                                </xsl:choose>

                                                            </label>
                                                        </li>
                                                    </xsl:for-each>
                                                </ul>
                                            </xsl:if>


                                        </div>
                                    </td>
                                </tr>
                                    <tr>
                                        <td/>
                                        <td>
                                            <div class="b-input">
                                                <div class="b-input__border">
                                                    <textarea>
                                                        <xsl:attribute name="class">b-input__textarea <xsl:value-of select="@name"/></xsl:attribute>
                                                        <xsl:attribute name="data-question">
                                                            <xsl:value-of select="@name"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="id">
                                                            <xsl:value-of select="@name"/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="name">
                                                            <xsl:value-of select="@name"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of select="' '"/>
                                                    </textarea>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div class="b-task__separator">

                                            </div>
                                        </td>
                                    </tr>
                                </xsl:for-each>

                                <tr>
                                    <td colspan="2">
                                        <div class="b-static-text">
                                            <h3>Расскажите нам о себе</h3>
                                        </div>
                                    </td>
                                </tr>

                                <xsl:for-each select="//root/userData/*">
                                    <tr>

                                        <td>

                                            <xsl:if test="not(contains(@type, &apos;checkbox&apos;))">
                                                <label>
                                                    <xsl:attribute name="for"><xsl:value-of select="name()"/></xsl:attribute>
                                                    <xsl:attribute name="class">b-static-text <xsl:if test="count(validators/validator[@rule=&quot;required&quot;]) &gt; 0">b-static-text_weight_bold</xsl:if></xsl:attribute>
                                                    <xsl:value-of select="text"/>
                                                </label>
                                            </xsl:if>
                                        </td>

                                        <td>
                                            <div class="b-input">


                                                <xsl:if test="contains(@type, &apos;file&apos;)">
                                                    <input type="file" class="b-input__file">
                                                        <xsl:attribute name="id"><xsl:value-of select="name()"/></xsl:attribute>
                                                        <xsl:attribute name="name"><xsl:value-of select="name()"/></xsl:attribute>
                                                        <xsl:if test="count(validators/validator) &gt; 0">
                                                            <xsl:attribute name="data-val">true</xsl:attribute>
                                                        </xsl:if>
                                                    </input>

                                                </xsl:if>


                                                <xsl:if test="contains(@type, &apos;text&apos;) and not(contains(@type, &apos;textarea&apos;))">
                                                    <div class="b-input__border">
                                                        <input type="text" class="b-input__text">
                                                            <xsl:attribute name="id"><xsl:value-of select="name()"/></xsl:attribute>
                                                            <xsl:attribute name="name"><xsl:value-of select="name()"/></xsl:attribute>
                                                            <xsl:if test="count(validators/validator) &gt; 0">
                                                                <xsl:attribute name="data-val">true</xsl:attribute>
                                                            </xsl:if>
                                                            <xsl:if test="count(validators/validator[@rule=&quot;required&quot;]) &gt; 0">
                                                                <xsl:attribute name="data-val-required"><xsl:value-of
                                                                        select="validators/validator[@rule=&quot;required&quot;]/text()"/></xsl:attribute>
                                                            </xsl:if>
                                                            <xsl:if test="count(validators/validator[@rule=&quot;email&quot;]) &gt; 0">
                                                                <xsl:attribute name="data-val-email"><xsl:value-of
                                                                        select="validators/validator[@rule=&quot;email&quot;]/text()"/></xsl:attribute>
                                                            </xsl:if>
                                                        </input>
                                                    </div>
                                                </xsl:if>

                                                <xsl:if test="contains(@type, &apos;checkbox&apos;)">
                                                    <input type="checkbox" class="b-input__checkbox">
                                                        <xsl:attribute name="id"><xsl:value-of select="name()"/></xsl:attribute>
                                                        <xsl:attribute name="name"><xsl:value-of select="name()"/></xsl:attribute>
                                                        <xsl:if test="count(validators/validator) &gt; 0">
                                                            <xsl:attribute name="data-val">true</xsl:attribute>
                                                        </xsl:if>
                                                        <xsl:if test="count(validators/validator[@rule=&quot;required&quot;]) &gt; 0">
                                                            <xsl:attribute name="data-val-mandatory"><xsl:value-of
                                                                    select="validators/validator[@rule=&quot;required&quot;]/text()"/></xsl:attribute>
                                                        </xsl:if>
                                                    </input>
                                                    <label>
                                                        <xsl:attribute name="for"><xsl:value-of select="name()"/></xsl:attribute>
                                                        <xsl:attribute name="class">b-static-text <xsl:if test="count(validators/validator[@rule=&quot;required&quot;]) &gt; 0">b-static-text_weight_bold</xsl:if></xsl:attribute>
                                                        <xsl:value-of select="text"/>
                                                    </label>
                                                </xsl:if>

                                                <xsl:if test="contains(@type, &apos;select&apos;)">
                                                    <select class="b-input__select">
                                                        <xsl:attribute name="id"><xsl:value-of select="name()"/></xsl:attribute>
                                                        <xsl:attribute name="name"><xsl:value-of select="name()"/></xsl:attribute>
                                                        <xsl:if test="count(validators/validator) &gt; 0">
                                                            <xsl:attribute name="data-val">true</xsl:attribute>
                                                        </xsl:if>
                                                        <xsl:if test="count(validators/validator[@rule=&quot;required&quot;]) &gt; 0">
                                                            <xsl:attribute name="data-val-required"><xsl:value-of
                                                                    select="validators/validator[@rule=&quot;required&quot;]/text()"/></xsl:attribute>
                                                        </xsl:if>

                                                        <option value="">Выбрать</option>
                                                        <xsl:for-each select="options/option">
                                                            <option>
                                                                <xsl:attribute name="value">
                                                                    <xsl:value-of select="@value"/>
                                                                </xsl:attribute>
                                                                <xsl:value-of select="text()"/>
                                                            </option>
                                                        </xsl:for-each>
                                                    </select>
                                                </xsl:if>

                                                <xsl:if test="contains(@type, &apos;textarea&apos;)">
                                                    <div class="b-input__border">
                                                        <textarea class="b-input__textarea">
                                                            <xsl:attribute name="id"><xsl:value-of select="name()"/></xsl:attribute>
                                                            <xsl:attribute name="name"><xsl:value-of select="name()"/></xsl:attribute>
                                                            <xsl:if test="count(validators/validator) &gt; 0">
                                                                <xsl:attribute name="data-val">true</xsl:attribute>
                                                            </xsl:if>
                                                            <xsl:if test="count(validators/validator[@rule=&quot;required&quot;]) &gt; 0">
                                                                <xsl:attribute name="data-val-required"><xsl:value-of
                                                                        select="validators/validator[@rule=&quot;required&quot;]/text()"/></xsl:attribute>
                                                            </xsl:if>
                                                            <xsl:value-of select="' '"/>
                                                        </textarea>
                                                    </div>
                                                </xsl:if>
                                                
                                                <xsl:if test="count(hint) &gt; 0">
                                                    <div class="b-input__hint"><xsl:value-of select="hint/text()"/></div>
                                                    
                                                </xsl:if>


                                                <label class="b-input__error">
                                                    <xsl:attribute name="for"><xsl:value-of select="name()"/></xsl:attribute>
                                                    <xsl:attribute name="data-valmsg-for"><xsl:value-of select="name()"/></xsl:attribute>
                                                    <xsl:attribute name="data-valmsg-replace">true</xsl:attribute>

                                                </label>

                                            </div>

                                        </td>


                                    </tr>

                                </xsl:for-each>

                                <tr>
                                    <td colspan="2">
                                        <input type="hidden" name="hidden" id="hidden" value="a" />
                                        <label for="hidden" class="b-input__error">
                                            <xsl:attribute name="data-valmsg-for">hidden</xsl:attribute>
                                            <xsl:attribute name="data-valmsg-replace">true</xsl:attribute>

                                        </label>

                                    </td>
                                </tr>


                                <tr>
                                    <td class="b-buttons" colspan="2">
                                        <div class="b-buttons__inner">
                                            <input type="submit" value="Отправить"/>
                                            <input type="reset" value="Очистить"/>
                                        </div>
                                    </td>
                                </tr>



                            </table>
                        </div>


                    </form>


                </div>






            </body>
        </html>





    </xsl:template>

</xsl:stylesheet>