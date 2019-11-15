FROM alpine/git AS ecs

RUN git clone https://git.freeit.de/ecs4 /ecs

RUN git clone https://git.freeit.de/ecs_vip_template /vip_template

FROM ruby:2.3

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /srv/ecs

COPY --from=ecs /ecs/Gemfile /ecs/Gemfile.lock ./
RUN bundle install

COPY --from=ecs /ecs ./
COPY --from=ecs /vip_template/ecs_vip.rb ./ecs_vip.rb

ENV RACK_ENV=development
ENV ECS_PORT=80

EXPOSE ${ECS_PORT}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
    