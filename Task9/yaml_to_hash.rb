# frozen_string_literal: true

require 'yaml'

yaml_input = <<~YAML
  stage: # name env
    adapter: mysql2 # not obligatory
    encoding: utf8  # not obligatory
    reconnect: false # not obligatory
    database: test-mysql2_development # obligatory
    pool: 5 # not obligatory, by default 1
    timeout: 5000 # not obligatory, by default 1000
    username: root # not obligatory
    password: password # not obligatory
    socket: /tmp/mysql.sock # not obligatory

  development:
    adapter: sqlite3
    database: db/development.sqlite3
    pool: 5
    timeout: 1000

  production:
    adapter: postgresql
    encoding: unicode
    database: test-postgres_production
    pool: 5
    username: test-postgres
    password: x123
YAML

parsed_data = YAML.safe_load(yaml_input)
puts parsed_data
