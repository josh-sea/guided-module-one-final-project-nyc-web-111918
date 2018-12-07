require 'bundler'
require 'artii'
require 'csv'
Bundler.require
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/database.db')
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)
ActiveRecord::Base.logger.level = 1
require_all 'lib'
