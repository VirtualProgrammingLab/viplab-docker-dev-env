FROM alpine/git AS ecs

RUN git clone https://git.freeit.de/ecs4 /ecs

FROM ruby:2.3

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /srv/ecs

COPY --from=ecs /ecs/Gemfile /ecs/Gemfile.lock ./
RUN bundle install

COPY --from=ecs /ecs ./

ENV RACK_ENV=development
ENV ECS_PORT=80

EXPOSE ${ECS_PORT}

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
    