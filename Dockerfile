FROM ruby:2.3

RUN bundle config --global frozen 1

WORKDIR /home

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 8126

CMD ["bundle", "exec", "ruby", "app.rb"]
