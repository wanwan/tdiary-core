require 'spec_helper'

Dir["#{File.dirname(__FILE__)}/acceptance/support/**/*.rb"].each {|f| require f}

require 'tdiary/application'
Capybara.app = Rack::Builder.new do
	map '/' do
		run TDiary::Application.new(:index)
	end

	map '/index.rb' do
		run TDiary::Application.new(:index)
	end

	map '/update.rb' do
		run TDiary::Application.new(:update)
	end
end

Capybara.save_and_open_page_path = File.dirname(__FILE__) + '/../tmp/capybara'

RSpec.configure do |config|
	fixture_conf = File.expand_path('../fixtures/just_installed.conf', __FILE__)
	tdiary_conf = File.expand_path("../fixtures/tdiary.conf.#{ENV['TEST_MODE'] || 'rack'}", __FILE__)
	work_data_dir = File.expand_path('../../tmp/data', __FILE__)
	work_conf = File.expand_path('../../tdiary.conf', __FILE__)

	config.treat_symbols_as_metadata_keys_with_true_values = true

	config.before(:all) do
		FileUtils.cp_r tdiary_conf, work_conf, :verbose => false
	end

	config.before(:each) do
		FileUtils.mkdir_p work_data_dir
		FileUtils.cp_r fixture_conf, File.join(work_data_dir, "tdiary.conf"), :verbose => false unless fixture_conf.empty?
	end

	config.after(:each) do
		FileUtils.rm_r work_data_dir
	end

	config.after(:all) do
		FileUtils.rm_r work_conf
	end

	case ENV['TEST_MODE']
	when 'webrick'
		Capybara.default_driver = :selenium
		Capybara.app_host = 'http://localhost:' + (ENV['PORT'] || '19292')
		config.filter_run_excluding :exclude_selenium
		config.filter_run_excluding :exclude_no_secure
	when 'secure'
		config.filter_run_excluding :exclude_rack
		config.filter_run_excluding :exclude_secure
	else
		config.filter_run_excluding :exclude_rack
		config.filter_run_excluding :exclude_no_secure
	end
end

# Local Variables:
# mode: ruby
# indent-tabs-mode: t
# tab-width: 3
# ruby-indent-level: 3
# End:
# vim: ts=3
