require 'spec_helper'

describe 'external_fact::fact' do
  let(:pre_condition) do
    'include external_fact'
  end
  let(:title) { 'namevar' }
  let(:params) do
    {}
  end

  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
