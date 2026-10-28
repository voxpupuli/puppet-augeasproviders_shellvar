# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'shellvar' do
  before(:all) do
    shell("printf '# test file\\nFOO=bar\\n' > /tmp/shellvar_test")
  end

  context 'with ensure => present' do
    it_behaves_like 'an idempotent resource' do
      let(:manifest) do
        <<~PUPPET
          shellvar { 'FOO':
            ensure => present,
            target => '/tmp/shellvar_test',
            value  => 'baz',
          }
          shellvar { 'disable rsyncd':
            ensure   => present,
            target   => '/tmp/shellvar_test',
            variable => 'RSYNC_ENABLE',
            value    => 'false',
            comment  => 'managed by puppet',
          }
          shellvar { 'RSYNC_OPTS':
            ensure => present,
            target => '/tmp/shellvar_test',
            value  => '--daemon --address 127.0.0.1',
          }
        PUPPET
      end
    end

    describe file('/tmp/shellvar_test') do
      its(:content) { is_expected.to match(%r{^# test file$}) }
      its(:content) { is_expected.to match(%r{^FOO=baz$}) }
      its(:content) { is_expected.to match(%r{# RSYNC_ENABLE: managed by puppet\nRSYNC_ENABLE=false$}) }
      its(:content) { is_expected.to match(%r{^RSYNC_OPTS="--daemon --address 127.0.0.1"$}) }
    end
  end

  context 'with ensure => absent' do
    it_behaves_like 'an idempotent resource' do
      let(:manifest) do
        <<~PUPPET
          shellvar { 'FOO':
            ensure => absent,
            target => '/tmp/shellvar_test',
          }
        PUPPET
      end
    end

    describe file('/tmp/shellvar_test') do
      its(:content) { is_expected.not_to match(%r{^FOO=}) }
      its(:content) { is_expected.to match(%r{^RSYNC_ENABLE=false$}) }
    end
  end
end
