require 'spec_helper'

describe 'apache::mod::auth_gssapi', type: :class do
  it_behaves_like 'a mod class, without including apache'

  context 'default configuration with parameters' do
    context 'on a Debian OS', :compile do
      let :facts do
        {
          id: 'root',
          kernel: 'Linux',
          lsbdistcodename: 'squeeze',
          osfamily: 'Debian',
          operatingsystem: 'Debian',
          operatingsystemrelease: '6',
          path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
          is_pe: false,
        }
      end

      it { is_expected.to contain_class('apache::params') }
      it { is_expected.to contain_apache__mod('auth_gssapi') }
      it { is_expected.to contain_package('libapache2-mod-auth-gssapi') }
    end
    context 'on a RedHat OS', :compile do
      let :facts do
        {
          id: 'root',
          kernel: 'Linux',
          osfamily: 'RedHat',
          operatingsystem: 'RedHat',
          operatingsystemrelease: '6',
          path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
          is_pe: false,
        }
      end

      it { is_expected.to contain_class('apache::params') }
      it { is_expected.to contain_apache__mod('auth_gssapi') }
      it { is_expected.to contain_package('mod_auth_gssapi') }
    end
    context 'on a FreeBSD OS', :compile do
      let :facts do
        {
          id: 'root',
          kernel: 'FreeBSD',
          osfamily: 'FreeBSD',
          operatingsystem: 'FreeBSD',
          operatingsystemrelease: '9',
          path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
          is_pe: false,
        }
      end

      it { is_expected.to contain_class('apache::params') }
      it { is_expected.to contain_apache__mod('auth_gssapi') }
      it { is_expected.to contain_package('www/mod_auth_gssapi') }
    end
    context 'on a Gentoo OS', :compile do
      let :facts do
        {
          id: 'root',
          kernel: 'Linux',
          osfamily: 'Gentoo',
          operatingsystem: 'Gentoo',
          path: '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin',
          operatingsystemrelease: '3.16.1-gentoo',
          is_pe: false,
        }
      end

      it { is_expected.to contain_class('apache::params') }
      it { is_expected.to contain_apache__mod('auth_gssapi') }
      it { is_expected.to contain_package('www-apache/mod_auth_gssapi') }
    end
  end
end
