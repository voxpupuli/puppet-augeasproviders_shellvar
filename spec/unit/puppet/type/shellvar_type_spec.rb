#!/usr/bin/env rspec

require 'spec_helper'

describe Puppet::Type.type(:shellvar) do
  context 'when setting quoted' do
    it 'has a default of auto' do
      resource = Puppet::Type.type(:shellvar).new name: 'foo'
      resource[:quoted].should == :auto
    end

    it 'converts true to auto' do
      resource = Puppet::Type.type(:shellvar).new name: 'foo', quoted: :true
      resource[:quoted].should == :auto
    end

    it 'converts false to none' do
      resource = Puppet::Type.type(:shellvar).new name: 'foo', quoted: :false
      resource[:quoted].should == :none
    end
  end

  context 'when using composite namevar' do
    it 'has a variable and target' do
      resource = Puppet::Type.type(:shellvar).new name: 'foo in /tmp/bar'
      resource[:variable].should eq('foo')
      resource[:target].should eq('/tmp/bar')
    end
  end
end
