require 'spec_helper'

describe 'augeasproviders_shellvar::bulk' do

  describe 'default options' do
    let(:title) { 'thekey=thevalue' }
    let(:params) {{
      :target => '/tmp/test.txt',
    }}
    it { should compile }
    it { should contain_shellvar('/tmp/test.txt thekey').with(
      :ensure        => 'present',
      :variable      => 'thekey',
      :value         => 'thevalue',
      :target        => '/tmp/test.txt',
      :quoted        => nil
    )}
  end

  describe 'with double-quotes enabled' do
    let(:title) { 'thekey=thevalue' }
    let(:params) {{
      :target => '/tmp/test.txt',
      :quoted => 'double',
    }}
    it { should compile }
    it { should contain_shellvar('/tmp/test.txt thekey').with(
      :ensure        => 'present',
      :variable      => 'thekey',
      :value         => 'thevalue',
      :target        => '/tmp/test.txt',
      :quoted        => 'double',
    )}
  end

end
