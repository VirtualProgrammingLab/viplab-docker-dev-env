FROM alpine/git as plugins

RUN set -eux; \
    git clone -b release_5_4 https://github.com/TIK-NFL/ViPLab.git /viplab; \
    git clone -b release_5_4 https://github.com/TIK-NFL/ViPLabCron.git /viplab-cron; \
    git clone -b release_5_4 https://github.com/TIK-NFL/ViPLabEvent.git /viplab-event

FROM legion2/ilias-test-docker:release_5-4

COPY --from=plugins /viplab /var/www/html/ilias/Customizing/global/plugins/Modules/TestQuestionPool/Questions/assViPLab
COPY --from=plugins /viplab-cron /var/www/html/ilias/Customizing/global/plugins/Services/Cron/CronHook/ViPLabCron
COPY --from=plugins /viplab-event /var/www/html/ilias/Customizing/global/plugins/Services/EventHandling/EventHook/ViPLabEvent

RUN docker-entrypoint.sh "install-plugin.sh assviplab qst TestQuestionPool Modules assViPLab;install-plugin.sh viplabcron crnhk Cron Services ViPLabCron;install-plugin.sh viplabevent evhk EventHandling Services ViPLabEvent"
