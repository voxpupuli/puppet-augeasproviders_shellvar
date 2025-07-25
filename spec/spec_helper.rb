# frozen_string_literal: true

# Managed by modulesync - DO NOT EDIT
# https://voxpupuli.org/docs/updating-files-managed-with-modulesync/

# puppetlabs_spec_helper will set up coverage if the env variable is set.
# We want to do this if lib exists and it hasn't been explicitly set.
ENV['COVERAGE'] ||= 'yes' if Dir.exist?(File.expand_path('../lib', __dir__))

require 'voxpupuli/test/spec_helper'

RSpec.configure do |c|
  c.facterdb_string_keys = false
end

add_mocked_facts!

if File.exist?(File.join(__dir__, 'default_module_facts.yml'))
  facts = YAML.safe_load(File.read(File.join(__dir__, 'default_module_facts.yml')))
  facts&.each do |name, value|
    add_custom_fact name.to_sym, value
  end
end

require 'spec_helper_local'
require 'augeas_spec'

# augeasproviders: setting $LOAD_PATH to work around broken type autoloading

$LOAD_PATH.unshift(File.join(__dir__, 'fixtures/modules/augeasproviders_core/lib'))
Dir['./spec/support/spec/**/*.rb'].sort.each { |f| require f }
