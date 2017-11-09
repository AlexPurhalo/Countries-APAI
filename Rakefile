namespace :db do
  require 'sequel'

  Sequel.extension :migration

  DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/database.db')

  require_relative 'app/core'

  desc 'Prints current schema version'
  task :version do
    version = if DB.tables.include?(:schema_info)
                DB[:schema_info].first[:version]
              end || 0

    puts 'Schema Version: ' + version.to_s
  end

  desc 'Perform migration up to latest migration available'
  task :migrate do
    Sequel::Migrator.run(DB, 'db/migrations')
    Rake::Task['db:version'].execute
  end

  desc 'Perform rollback to specified target or full rollback as default'
  task :rollback, :target do |t, args|
    args.with_defaults(:target => 0)

    Sequel::Migrator.run(DB, 'db/migrations', :target => args[:target].to_i)
    Rake::Task['db:version'].execute
  end

  desc 'Load the seed data'
  task :seed do
    load 'db/seeds.rb'
  end
end