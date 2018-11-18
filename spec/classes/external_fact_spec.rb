require 'spec_helper'

describe 'external_fact' do
  on_supported_os(facterversion: '2.4').each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      let(:params) do
        { 'site_id' => 'my_site' }
      end

      it { is_expected.to compile }
    end
  end
end
