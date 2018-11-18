require 'spec_helper'

describe 'external_fact::fact' do
  let(:pre_condition) do
    "class { 'external_fact': site_id => 'my_site' }"
  end
  let(:title) { 'foo' }
  let(:params) do
    { 'external_fact_value' => 'bar' }
  end

  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
