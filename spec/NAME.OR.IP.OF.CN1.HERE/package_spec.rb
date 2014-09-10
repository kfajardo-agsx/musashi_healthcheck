require 'spec_helper'

describe package('accountsservice') do 
	it { should be_installed.with_version('0.6.35-0ubuntu7') }	
end

describe package('acl') do
	it { should be_installed.with_version('2.2.52-1') }
end

describe package('adduser') do
	it { should be_installed.with_version('3.113+nmu3ubuntu3') }
end

describe package('apparmor') do
	it { should be_installed.with_version('2.8.95~2430-0ubuntu5') }	
end

describe package('apt') do
	it { should be_installed.with_version('1.0.1ubuntu2.1') }	
end

describe package('apt-transport-https') do
	it { should be_installed.with_version('1.0.1ubuntu2.1') }	
end

describe package('apt-utils') do
	it { should be_installed.with_version('1.0.1ubuntu2.1') }	
end

describe package('aptitude') do
	it { should be_installed.with_version('0.6.8.2-1ubuntu4') }	
end

describe package('aptitude-common') do
	it { should be_installed.with_version('0.6.8.2-1ubuntu4') }	
end

describe package('at') do
	it { should be_installed.with_version('3.1.14-1ubuntu1') }	
end

describe package('aufs-tools') do
	it { should be_installed.with_version('1:3.2+20130722-1.1') }	
end

describe package('augeas-lenses') do
	it { should be_installed.with_version('1.2.0-0ubuntu1.1') }	
end

describe package('autoconf') do
	it { should be_installed.with_version('2.69-6') }	
end

describe package('automake') do
	it { should be_installed.with_version('1:1.14.1-2ubuntu1') }	
end

describe package('autotools-dev') do
	it { should be_installed.with_version('20130810.1') }	
end

describe package('base-files') do
	it { should be_installed.with_version('7.2ubuntu5') }	
end

describe package('base-passwd') do
	it { should be_installed.with_version('3.5.33') }	
end

describe package('bash') do
	it { should be_installed.with_version('4.3-7ubuntu1') }	
end

describe package('bash-completion') do
	it { should be_installed.with_version('1:2.1-4') }	
end

describe package('bind9-host') do
	it { should be_installed.with_version('1:9.9.5.dfsg-3') }	
end

describe package('binutils') do
	it { should be_installed.with_version('2.24-5ubuntu3') }	
end

describe package('biosdevname') do
	it { should be_installed.with_version('0.4.1-0ubuntu6.1') }	
end

describe package('bridge-utils') do
	it { should be_installed.with_version('1.5-6ubuntu2') }	
end

describe package('bsdmainutils') do
	it { should be_installed.with_version('9.0.5ubuntu1') }	
end

describe package('bsdutils') do
	it { should be_installed.with_version('1:2.20.1-5.1ubuntu20.1') }	
end

describe package('btrfs-tools') do
	it { should be_installed.with_version('3.12-1') }	
end

describe package('build-essential') do
	it { should be_installed.with_version('11.5-6ubuntu6') }	
end

describe package('busybox-initramfs') do
	it { should be_installed.with_version('1:1.21.0-1ubuntu1') }	
end

describe package('busybox-static') do
	it { should be_installed.with_version('1:1.21.0-1ubuntu1') }	
end

describe package('bzip2') do
	it { should be_installed.with_version('1.0.6-5') }	
end

describe package('ca-certificates') do
	it { should be_installed.with_version('20130906ubuntu2') }	
end

describe package('cdbs') do
	it { should be_installed.with_version('0.4.122ubuntu2') }	
end

describe package('ceph-common') do
	it { should be_installed.with_version('0.80.1-0ubuntu1.1') }	
end

describe package('cgroup-lite') do
	it { should be_installed.with_version('1.9') }	
end

describe package('command-not-found') do
	it { should be_installed.with_version('0.3ubuntu12') }	
end

describe package('command-not-found-data') do
	it { should be_installed.with_version('0.3ubuntu12') }	
end

describe package('console-setup') do
	it { should be_installed.with_version('1.7ubuntu8') }	
end

describe package('coreutils') do
	it { should be_installed.with_version('8.21-1ubuntu5') }
end

describe package('cpio') do
	it { should be_installed.with_version('2.11+dfsg-1ubuntu1') }
end

describe package('cpp') do
	it { should be_installed.with_version('4:4.8.2-1ubuntu6') }
end

describe package('cpp-4.8') do
	it { should be_installed.with_version('4.8.2-19ubuntu1') }
end

describe package('cpu-checker') do
	it { should be_installed.with_version('0.7-0ubuntu4') }
end

describe package('crda') do
	it { should be_installed.with_version('1.1.2-1ubuntu2') }
end

describe package('cron') do
	it { should be_installed.with_version('3.0pl1-124ubuntu2') }
end

describe package('cryptsetup') do
	it { should be_installed.with_version('2:1.6.1-1ubuntu1') }
end

describe package('cryptsetup-bin') do
	it { should be_installed.with_version('2:1.6.1-1ubuntu1') }
end

describe package('curl') do
	it { should be_installed.with_version('7.35.0-1ubuntu2') }
end

describe package('dash') do
	it { should be_installed.with_version('0.5.7-4ubuntu1') }
end

describe package('dbus') do
	it { should be_installed.with_version('1.6.18-0ubuntu4') }
end

describe package('dctrl-tools') do
	it { should be_installed.with_version('2.23ubuntu1') }
end

describe package('debconf') do
	it { should be_installed.with_version('1.5.51ubuntu2') }
end

describe package('debconf-i18n') do
	it { should be_installed.with_version('1.5.51ubuntu2') }
end

describe package('debhelper') do
	it { should be_installed.with_version('9.20131227ubuntu1') }
end

describe package('debianutils') do
	it { should be_installed.with_version('4.4') }
end

describe package('debootstrap') do
	it { should be_installed.with_version('1.0.59ubuntu0.1') }
end

describe package('devscripts') do
	it { should be_installed.with_version('2.14.1') }
end

describe package('dh-apparmor') do
	it { should be_installed.with_version('2.8.95~2430-0ubuntu5') }
end

describe package('dh-python') do
	it { should be_installed.with_version('1.20140128-1ubuntu8') }
end

describe package('dh-translations') do
	it { should be_installed.with_version('121') }
end

describe package('diamond') do
	it { should be_installed.with_version('3.4.271') }
end

describe package('diffstat') do
	it { should be_installed.with_version('1.58-1') }
end

describe package('diffutils') do
	it { should be_installed.with_version('1:3.3-1') }
end


describe package('distro-info-data') do
	it { should be_installed.with_version('0.18ubuntu0.1')}
end

describe package('dmidecode') do
	it { should be_installed.with_version('2.12-2') }
end

describe package('dmsetup') do
	it { should be_installed.with_version('2:1.02.77-6ubuntu2') }
end

describe package('dnsmasq-base') do
	it { should be_installed.with_version('2.68-1') }
end

describe package('dnsmasq-utils') do
	it { should be_installed.with_version('2.68-1') }
end

describe package('dnsutils') do
	it { should be_installed.with_version('1:9.9.5.dfsg-3') }
end

describe package('dosfstools') do
	it { should be_installed.with_version('3.0.26-1') }
end

describe package('dpkg') do
	it { should be_installed.with_version('1.17.5ubuntu5.2') }
end

describe package('dpkg-dev') do
	it { should be_installed.with_version('1.17.5ubuntu5.3') }
end

 describe package('dput') do
 	it { should be_installed.with_version('0.9.6.4ubuntu1') }
 end

describe package('e2fslibs:amd64') do
	it { should be_installed.with_version('1.42.9-3ubuntu1') }
end

describe package('e2fsprogs') do
	it { should be_installed.with_version('1.42.9-3ubuntu1') }
end

describe package('ebtables') do
	it { should be_installed.with_version('2.0.10.4-3ubuntu1') }
end

describe package('ed') do
	it { should be_installed.with_version('1.9-2') }
end

describe package('eject') do
	it { should be_installed.with_version('2.1.5+deb1+cvs20081104-13.1') }
end

describe package('ethtool') do
	it { should be_installed.with_version('1:3.13-1') }
end

describe package('fakeroot') do
	it { should be_installed.with_version('1.20-3ubuntu2 ') }
end

describe package('file') do
	it { should be_installed.with_version('1:5.14-2ubuntu3.1') }
end

describe package('findutils') do
	it { should be_installed.with_version('4.4.2-7') }
end

describe package('fontconfig-config') do
	it { should be_installed.with_version('2.11.0-0ubuntu4.1') }
end

describe package('fonts-dejavu-core') do
	it { should be_installed.with_version('2.34-1ubuntu1 ') }
end

describe package('friendly-recovery') do
	it { should be_installed.with_version('0.2.25') }
end

describe package('ftp') do
	it { should be_installed.with_version('0.17-28') }
end

describe package('fuse') do
	it { should be_installed.with_version('2.9.2-4ubuntu4') } 
end

describe package('g++') do
	it { should be_installed.with_version('4:4.8.2-1ubuntu6') }
end

describe package('g++-4.8') do
	it { should be_installed.with_version('4.8.2-19ubuntu1') }
end

describe package('gawk') do
	it { should be_installed.with_version('1:4.0.1+dfsg-2.1ubuntu2') }
end

describe package('gcc') do
	it { should be_installed.with_version('4:4.8.2-1ubuntu6') }   
end

describe package('gcc-4.8') do
	it { should be_installed.with_version('4.8.2-19ubuntu1') } 
end

describe package('gcc-4.8-base:amd64') do
	it { should be_installed.with_version('4.8.2-19ubuntu1') }
end

describe package('gcc-4.9-base:amd64') do
	it { should be_installed.with_version('4.9-20140406-0ubuntu1') }                             
end

describe package('genisoimage') do
	it { should be_installed.with_version('9:1.1.11-2ubuntu3') }
end

describe package('geoip-database') do
	it { should be_installed.with_version('20140313-1') }
end

describe package('gettext') do
	it { should be_installed.with_version('0.18.3.1-1ubuntu3') }
end

describe package('gettext-base') do
	it { should be_installed.with_version('0.18.3.1-1ubuntu3') }
end

describe package('ghostscript') do
	it { should be_installed.with_version('9.10~dfsg-0ubuntu10.2') }
end

describe package ('gir1.2-glib-2.0') do
	it { should be_installed.with_version('1.40.0-1ubuntu0.1') }                 
end

describe package('git') do
	it { should be_installed.with_version('1:1.9.1-1')}
end

describe package('git-man') do 
	it { should be_installed.with_version('1:1.9.1-1')}
end

describe package('gnupg') do
	it { should be_installed.with_version('1.4.16-1ubuntu2')}
end

describe package('gpgv') do 
	it { should be_installed.with_version('1.4.16-1ubuntu2')}
end

describe package('grep') do
	it { should be_installed.with_version('2.16-1')}                             
end

describe package('groff-base') do
	it { should be_installed.with_version('1.22.2-5')}
end

describe package('gsfonts') do
	it { should be_installed.with_version('1:8.11+urwcyr1.0.7~pre44-4.2ubuntu1')}
end                        

describe package ('gzip') do
	it { should be_installed.with_version('1.6-3ubuntu1')}                             
end

describe package('hardening-includes') do
	it { should be_installed.with_version('2.5ubuntu2')}             
end

describe package('hdparm') do
	it { should be_installed.with_version('9.43-1ubuntu3')}
end

describe package('hostname') do
	it { should be_installed.with_version('3.15ubuntu1')}
end

describe package('icoutils') do
	it { should be_installed.with_version('0.31.0-2')}
end

describe package('ifupdown') do
	it { should be_installed.with_version('0.7.47.2ubuntu4.1')}
end

describe package('info') do
	it { should be_installed.with_version('5.2.0.dfsg.1-2')}
end

describe package('init-system-helpers') do
	it { should be_installed.with_version('1.14')}
end

describe package('initramfs-tools') do
	it { should be_installed.with_version('0.103ubuntu4.2')} 
end

describe package('initramfs-tools-bin') do
	it { should be_installed.with_version('0.103ubuntu4.2')}             
end

describe package('initscripts') do
	it { should be_installed.with_version('2.88dsf-41ubuntu6')}  
end                    

describe package('insserv') do
	it { should be_installed.with_version('1.14.0-5ubuntu2')}
end                         

describe package('install-info') do
	it { should be_installed.with_version('5.2.0.dfsg.1-2')}
end                     

describe package('installation-report') do
	it { should be_installed.with_version('2.54ubuntu1')}
end 

describe package('intltool') do
	it { should be_installed.with_version('0.50.2-2')} 
end                        

describe package('intltool-debian') do
	it { should be_installed.with_version('0.35.0+20060710.1')}                  
end

describe package('iproute') do
	it { should be_installed.with_version('1:3.12.0-2')}                          
end


describe package ('iproute2') do
	it { should be_installed.with_version('3.12.0-2')}
end                     

describe package ('iptables') do
	it { should be_installed.with_version('1.4.21-1ubuntu1')} 
end                       

describe package ('iputils-arping') do
	it { should be_installed.with_version('3:20121221-4ubuntu1.1')}
end                 

describe package('iputils-ping') do
	it { should be_installed.with_version('3:20121221-4ubuntu1.1')}  
end                   

describe package('iputils-tracepath') do
	it { should be_installed.with_version('3:20121221-4ubuntu1.1')}
end

describe package('ipxe-qemu') do
	it { should be_installed.with_version('1.0.0+git-20131111.c3d1e78-2ubuntu1')}                        
end

describe package('irqbalance') do
	it { should be_installed.with_version('1.0.6-2')} 
end                     

describe package('isc-dhcp-client') do
    it { should be_installed.with_version('4.2.4-7ubuntu12')}
end

describe package('isc-dhcp-common') do
	it { should be_installed.with_version('4.2.4-7ubuntu12')}
end

describe package('iso-codes') do
	it { should be_installed.with_version('3.52-1')}
end

describe package('jfsutils') do
	it { should be_installed.with_version('1.1.15-2.1')} 
end                        

describe package('kbd') do
	it { should be_installed.with_version('1.15.5-1ubuntu1')}
end                           

describe package('keyboard-configuration') do
    it { should be_installed.with_version('1.70ubuntu8')}
end

describe package('klibc-utils') do 
	it { should be_installed.with_version('2.0.3-0ubuntu1')}
end

describe package('kmod') do
	it { should be_installed.with_version('15-0ubuntu6')}
end

describe package('kpartx') do
	it { should be_installed.with_version('0.4.9-3ubuntu7')}
end

describe package('krb5-locales') do
	it { should be_installed.with_version('1.12+dfsg-2ubuntu4')}
end

describe package('language-selector-common') do
	it { should be_installed.with_version('0.129')}
end

describe package('ldmtool') do
	it { should be_installed.with_version('0.2.3-2ubuntu1')}
end

describe package('less') do
	it { should be_installed.with_version('458-2')}
end

describe package('libaccountsservice0:amd64') do
	it { should be_installed.with_version('0.6.35-0ubuntu7')}
end

describe package('libacl1:amd64') do
	it { should be_installed.with_version('2.2.52-1')}
end

describe package('libaio1:amd64') do
	it { should be_installed.with_version('0.3.109-4')}
end

describe package('libalgorithm-diff-perl') do
	it { should be_installed.with_version('1.19.02-3')}
end

describe package('libalgorithm-diff-xs-perl') do
	it { should be_installed.with_version('0.04-2build4')}
end

describe package('libalgorithm-merge-perl') do
	it { should be_installed.with_version('0.08-2')}
end

describe package('libapparmor-perl') do
	it { should be_installed.with_version('2.8.95~2430-0ubuntu5')}
end

describe package('libapparmor1:amd64') do
	it { should be_installed.with_version('2.8.95~2430-0ubuntu5')}
end

describe package('libapt-inst1.5:amd64') do
	it { should be_installed.with_version('1.0.1ubuntu2.1')}
end

describe package('libapt-pkg-perl') do
	it { should be_installed.with_version('0.1.29build1')}
end

describe package('libapt-pkg4.12:amd64') do
	it { should be_installed.with_version('1.0.1ubuntu2.1')}
end

describe package('libarchive-extract-perl') do
	it { should be_installed.with_version('0.70-1')}
end

describe package('libarchive-zip-perl') do
	it { should be_installed.with_version('1.30-7')}
end

describe package('libasan0:amd64') do
	it { should be_installed.with_version('4.8.2-19ubuntu1')}
end

describe package('libasn1-8-heimdal:amd64') do
	it { should be_installed.with_version('1.6~git20131207+dfsg-1ubuntu1')}
end

describe package('libasound2:amd64') do
	it { should be_installed.with_version('1.0.27.2-3ubuntu7')}
end

describe package('libasound2-data') do
	it { should be_installed.with_version('1.0.27.2-3ubuntu7')}
end

describe package('libasprintf-dev:amd64') do
	it { should be_installed.with_version('0.18.3.1-1ubuntu3')}
end

describe package('libasprintf0c2:amd64') do
	it { should be_installed.with_version('0.18.3.1-1ubuntu3')}
end

describe package('libasyncns0:amd64') do
	it { should be_installed.with_version('0.8-4ubuntu2')}
end

describe package('libatomic1:amd64') do
	it { should be_installed.with_version('4.8.2-19ubuntu1')}
end

describe package('libattr1:amd64') do
	it { should be_installed.with_version('1:2.4.47-1ubuntu1')}
end

describe package('libaudit-common') do
	it { should be_installed.with_version('1:2.3.2-2ubuntu1')}
end

describe package('libaudit1:amd64') do
	it { should be_installed.with_version('1:2.3.2-2ubuntu1')}
end

describe package('libaugeas0') do
	it { should be_installed.with_version('1.2.0-0ubuntu1.1')}
end

describe package('libauthen-sasl-perl') do
	it { should be_installed.with_version('2.1500-1')}
end

describe package('libautodie-perl') do
	it { should be_installed.with_version('2.23-1')}
end

describe package('libavahi-client3:amd64') do
	it { should be_installed.with_version('0.6.31-4ubuntu1')}
end

describe package('libavahi-common-data:amd64') do
	it { should be_installed.with_version('0.6.31-4ubuntu1')}
end

describe package('libavahi-common3:amd64') do
	it { should be_installed.with_version('0.6.31-4ubuntu1')}
end

describe package('libbind9-90') do
	it { should be_installed.with_version('1:9.9.5.dfsg-3')}
end

describe package('libblkid1:amd64') do
	it { should be_installed.with_version('2.20.1-5.1ubuntu20.1')}
end

describe package('libbluetooth3:amd64 ') do
	it { should be_installed.with_version('4.101-0ubuntu13')}
end

describe package('libboost-iostreams1.54.0:amd64') do
	it { should be_installed.with_version('1.54.0-4ubuntu3')}
end

describe package('libboost-system1.54.0:amd64') do
	it { should be_installed.with_version('1.54.0-4ubuntu3.1')}
end

describe package('libboost-thread1.54.0:amd64') do
	it { should be_installed.with_version('1.54.0-4ubuntu3.1')}
end

describe package('libbrlapi0.6:amd64') do
	it { should be_installed.with_version('5.0-2ubuntu2')}
end

describe package('libbsd0:amd64') do
	it { should be_installed.with_version('0.6.0-2ubuntu1')}
end

describe package('libbz2-1.0:amd64') do
	it { should be_installed.with_version('1.0.6-5')}
end

describe package('libc-bin') do
	it { should be_installed.with_version('2.19-0ubuntu6')}
end

describe package('libc-dev-bin') do
	it { should be_installed.with_version('2.19-0ubuntu6.1')}
end

describe package('libc6:amd64') do
	it { should be_installed.with_version('2.19-0ubuntu6.1')}
end

describe package('libc6-dev:amd64') do
	it { should be_installed.with_version('2.19-0ubuntu6.1')}
end

describe package('libcaca0:amd64') do
	it { should be_installed.with_version('0.99.beta18-1ubuntu5')}
end

describe package('libcap-ng0') do
	it { should be_installed.with_version('0.7.3-1ubuntu2')}
end

describe package('libcap2:amd64 ') do
	it { should be_installed.with_version('1:2.24-0ubuntu2')}
end

describe package('libcap2-bin') do
	it { should be_installed.with_version('1:2.24-0ubuntu2')}
end

describe package('libcephfs1') do
	it { should be_installed.with_version('0.80.1-0ubuntu1.1')}
end

describe package('libcgmanager0:amd64') do
	it { should be_installed.with_version('0.24-0ubuntu6')}
end

describe package('libck-connector0:amd64') do
	it { should be_installed.with_version('0.4.5-3.1ubuntu2')}
end

describe package('libclass-accessor-perl') do
	it { should be_installed.with_version('0.34-1')}
end


describe package('libclone-perl') do
	it { should be_installed.with_version('0.36-1')}
end

describe package('libcloog-isl4:amd64') do
	it { should be_installed.with_version('0.18.2-1')}
end

describe package('libcomerr2:amd64') do
	it { should be_installed.with_version('1.42.9-3ubuntu1')}
end

describe package('libcommon-sense-perl') do
	it { should be_installed.with_version('3.72-2build1')}
end

describe package('libcroco3:amd64') do
	it { should be_installed.with_version('0.6.8-2ubuntu1')}
end

describe package('libcryptsetup4') do
	it { should be_installed.with_version('2:1.6.1-1ubuntu1')}
end

describe package('libcups2:amd64') do
	it { should be_installed.with_version('1.7.2-0ubuntu1.1')}
end

describe package('libcupsfilters1:amd64') do
	it { should be_installed.with_version('1.0.52-0ubuntu1.2')}
end

describe package('libcupsimage2:amd64') do
	it { should be_installed.with_version('1.7.2-0ubuntu1.1')}
end

describe package('libcurl3:amd64') do
	it { should be_installed.with_version('7.35.0-1ubuntu2')}
end

describe package('libcurl3-gnutls:amd64') do
	it { should be_installed.with_version('7.35.0-1ubuntu2')}
end

describe package('libcwidget3') do
	it { should be_installed.with_version('0.5.16-3.5ubuntu1')}
end

describe package('libdb5.3:amd64') do
	it { should be_installed.with_version('5.3.28-3ubuntu3')}
end

describe package('libdbus-1-3:amd64') do
	it { should be_installed.with_version('1.6.18-0ubuntu4')}
end

describe package('libdbus-glib-1-2:amd64') do
	it { should be_installed.with_version('0.100.2-1')}
end

describe package('libdebconfclient0:amd64') do
	it { should be_installed.with_version('0.187ubuntu1')}
end

describe package('libdevmapper-event1.02.1:amd64') do
	it { should be_installed.with_version('2:1.02.77-6ubuntu2')}
end

describe package('libdevmapper1.02.1:amd64') do
	it { should be_installed.with_version('2:1.02.77-6ubuntu2')}
end

describe package('libdigest-hmac-perl') do
	it { should be_installed.with_version('1.03+dfsg-1')}
end

describe package('libdistro-info-perl') do
	it { should be_installed.with_version('0.12')}
end

describe package('libdns100') do
	it { should be_installed.with_version('1:9.9.5.dfsg-3')}
end

describe package('libdpkg-perl') do
	it { should be_installed.with_version('1.17.5ubuntu5.3')}
end

describe package('libdrm-intel1:amd64') do
	it { should be_installed.with_version('2.4.52-1')}
end

describe package('libdrm-nouveau2:amd64') do
	it { should be_installed.with_version('2.4.52-1')}
end

describe package('libdrm-radeon1:amd64') do
	it { should be_installed.with_version('2.4.52-1')}
end

describe package('libdrm2:amd64') do
	it { should be_installed.with_version('1.12-4build1')}
end

describe package('libedit2:amd64') do
	it { should be_installed.with_version('3.1-20130712-2')}
end

describe package('libelf1:amd64') do
	it { should be_installed.with_version('0.158-0ubuntu5.1')}
end

describe package('libemail-valid-perl') do
	it { should be_installed.with_version('1.192-1')}
end

describe package('libencode-locale-perl') do
	it { should be_installed.with_version('1.03-1')}
end

describe package('libept1.4.12:amd64') do
	it { should be_installed.with_version('1.0.12')}
end

describe package('liberror-perl') do
	it { should be_installed.with_version('0.17-1.1')}
end

describe package('libestr0') do
	it { should be_installed.with_version('0.1.9-0ubuntu2')}
end

describe package('libexpat1:amd64') do
	it { should be_installed.with_version('2.1.0-4ubuntu1')}
end

describe package('libexporter-lite-perl') do
	it { should be_installed.with_version('0.02-2')}
end

describe package('libfakeroot:amd64') do
	it { should be_installed.with_version('1.20-3ubuntu2')}
end

describe package('libfdt1:amd64') do
	it { should be_installed.with_version('1.4.0+dfsg-1')}
end

describe package('libffi6:amd64') do
	it { should be_installed.with_version('3.1~rc1+r3.0.13-12')}
end

describe package('libfile-basedir-perl') do
	it { should be_installed.with_version('0.03-1fakesync1')}
end

describe package('libfile-fcntllock-perl') do
	it { should be_installed.with_version('0.14-2build1')}
end

describe package('libfile-listing-perl ') do
	it { should be_installed.with_version('6.04-1')}
end

describe package('libflac8:amd64') do
	it { should be_installed.with_version('1.3.0-2')}
end

describe package('libfont-afm-perl') do
	it { should be_installed.with_version('1.20-1')}
end

describe package('libfontconfig1:amd64') do
	it { should be_installed.with_version('2.11.0-0ubuntu4.1')}
end

describe package('libfreetype6:amd64') do
	it { should be_installed.with_version('2.5.2-1ubuntu2.2')}
end

describe package('libfribidi0:amd64') do
	it { should be_installed.with_version('0.19.6-1')}
end

describe package('libfuse2:amd64') do
	it { should be_installed.with_version('2.9.2-4ubuntu4')}
end

describe package('libgcc-4.8-dev:amd64') do
	it { should be_installed.with_version('4.8.2-19ubuntu1')}
end

describe package('libgcc1:amd64') do
	it { should be_installed.with_version('1:4.9-20140406-0ubuntu1')}
end

describe package('libgck-1-0:amd64') do
	it { should be_installed.with_version('3.10.1-1')}
end

describe package('libgcr-3-common') do
	it { should be_installed.with_version('3.10.1-1')}
end

describe package('libgcr-base-3-1:amd64') do
	it { should be_installed.with_version('3.10.1-1')}
end

describe package('libcrypt11:amd64') do
	it { should be_installed.with_version('1.5.3-2ubuntu4')}
end

describe package('libgdbm3:amd64') do
	it { should be_installed.with_version('1.8.3-12build1')}
end

describe package('libgeoip1:amd64') do
	it { should be_installed.with_version('1.6.0-1')}
end

describe package('libgettextpo-dev:amd64') do
	it { should be_installed.with_version('0.18.3.1-1ubuntu3')}
end

describe package('libgettextpo0:amd64') do
	it { should be_installed.with_version('0.18.3.1-1ubuntu3')}
end

describe package('libgirepository-1.0-1') do
	it { should be_installed.with_version('1.40.0-1ubuntu0.1')}
end

describe package('libgl1-mesa-dri:amd64') do
	it { should be_installed.with_version('10.1.3-0ubuntu0.1')}
end

describe package('libgl1-mesa-glx:amd64') do
	it { should be_installed.with_version('10.1.3-0ubuntu0.1')}
end

describe package('libglapi-mesa:amd64') do
	it { should be_installed.with_version('10.1.3-0ubuntu0.1')}
end

describe package('libglib2.0-0:amd64') do
	it { should be_installed.with_version('2.40.0-2')}
end

describe package('libglib2.0-data') do
	it { should be_installed.with_version('2.40.0-2')}
end

describe package('libgmp10:amd64') do
	it { should be_installed.with_version('2:5.1.3+dfsg-1ubuntu1')}
end

describe package('libgnutls-openssl27:amd64') do
	it { should be_installed.with_version('2.12.23-12ubuntu2.1')}
end

describe package('libgnutls26:amd64') do
	it { should be_installed.with_version('2.12.23-12ubuntu2.1')}
end

describe package('libgomp1:amd64') do
	it { should be_installed.with_version('4.8.2-19ubuntu1')}
end

describe package('libgoogle-perftools4') do
	it { should be_installed.with_version('2.1-2ubuntu1')}
end

describe package('libgpg-error0:amd64') do
	it { should be_installed.with_version('1.12-0.2ubuntu1')}
end

describe package('libgs9') do
	it { should be_installed.with_version('9.10~dfsg-0ubuntu10.2')}
end

describe package('libgs9-common') do
	it { should be_installed.with_version('9.10~dfsg-0ubuntu10.2')}
end

describe package('libgssapi-krb5-2:amd64') do
	it { should be_installed.with_version('1.12+dfsg-2ubuntu4')}
end

describe package('libgssapi3-heimdal:amd64') do
	it { should be_installed.with_version('1.6~git20131207+dfsg-1ubuntu1')}
end

describe package('libguestfs0:amd64') do
	it { should be_installed.with_version('1:1.24.5-1')}
end

describe package('libhcrypto4-heimdal:amd64') do
	it { should be_installed.with_version('1.6~git20131207+dfsg-1ubuntu1')}
end

describe package('libheimbase1-heimdal:amd64') do
	it { should be_installed.with_version('1.6~git20131207+dfsg-1ubuntu1')}
end

describe package('libheimntlm0-heimdal:amd64') do
	it { should be_installed.with_version('1.6~git20131207+dfsg-1ubuntu1')}
end

describe package('libhtml-form-perl') do
	it { should be_installed.with_version('6.03-1')}
end

describe package('libhtml-format-perl') do
	it { should be_installed.with_version('2.11-1')}
end

describe package('libhtml-parser-perl') do
	it { should be_installed.with_version('3.71-1build1')}
end

describe package('libhtml-tagset-perl') do
	it { should be_installed.with_version('3.20-2')}
end

describe package('libhtml-tree-perl') do
	it { should be_installed.with_version('5.03-1')}
end

describe package('libhttp-cookies-perl') do
	it { should be_installed.with_version('6.00-2')}
end

describe package('libhttp-daemon-perl') do
	it { should be_installed.with_version('6.01-1')}
end

describe package('libhttp-date-perl') do
	it { should be_installed.with_version('6.02-1')}
end

describe package('libhttp-message-perl') do
	it { should be_installed.with_version('6.06-1')}
end

describe package('libhttp-negotiate-perl') do
	it { should be_installed.with_version('6.00-2')}
end

describe package('libhx509-5-heimdal:amd64') do
	it { should be_installed.with_version('1.6~git20131207+dfsg-1ubuntu1')}
end

describe package('libidn11:amd64') do
	it { should be_installed.with_version('1.28-1ubuntu2')}
end

describe package('libijs-0.35') do
	it { should be_installed.with_version('0.35-8build1')}
end

describe package('libio-html-perl') do
	it { should be_installed.with_version('1.00-1')}
end

describe package('libio-pty-perl') do
	it { should be_installed.with_version('1:1.08-1build4')}
end

describe package('libio-socket-inet6-perl') do
	it { should be_installed.with_version('2.71-1')}
end

describe package('libio-socket-ssl-perl') do
	it { should be_installed.with_version('1.965-1ubuntu1')}
end

describe package('libio-string-perl') do
	it { should be_installed.with_version('1.08-3')}
end

describe package('libio-stringy-perl') do
	it { should be_installed.with_version('2.110-5')}
end

describe package('libipc-run-perl') do
	it { should be_installed.with_version('0.92-1')}
end

describe package('libipc-system-simple-perl') do
	it { should be_installed.with_version('1.25-2')}
end

describe package('libisc95') do
	it { should be_installed.with_version('1:9.9.5.dfsg-3')}
end

describe package('libisccc90') do
	it { should be_installed.with_version('1:9.9.5.dfsg-3')}
end

describe package('libisccfg90') do
	it { should be_installed.with_version('1:9.9.5.dfsg-3')}
end

describe package('libisl10:amd64') do
	it { should be_installed.with_version('0.12.2-1')}
end

describe package('libitm1:amd64') do
	it { should be_installed.with_version('4.8.2-19ubuntu1')}
end

describe package('libjbig0:amd64') do
	it { should be_installed.with_version('2.0-2ubuntu4.1')}
end

describe package('libjbig2dec0') do
	it { should be_installed.with_version('0.11+20120125-1ubuntu1')}
end

describe package('libjpeg-turbo8:amd64') do
	it { should be_installed.with_version('1.3.0-0ubuntu2')}
end

describe package('libjpeg8:amd64') do
	it { should be_installed.with_version('8c-2ubuntu8')}
end

describe package('libjs-jquery') do
	it { should be_installed.with_version('1.7.2+dfsg-2ubuntu1')}
end

describe package('libjs-sphinxdoc') do
	it { should be_installed.with_version('1.2.2+dfsg-1ubuntu1.1')}
end
 	
describe package('libjson-perl') do
	it { should be_installed.with_version('2.61-1')}
end

describe package('libjson-xs-perl') do
	it { should be_installed.with_version('2.340-1build1')}
end

describe package('libjson0:amd64') do
	it { should be_installed.with_version('0.11-3ubuntu1.2')}
end

describe package('libk5crypto3:amd64') do
	it { should be_installed.with_version('1.12+dfsg-2ubuntu4')}
end

describe package('libkeyutils1:amd64') do
	it { should be_installed.with_version('1.5.6-1')}
end

describe package('libklibc') do
	it { should be_installed.with_version('2.0.3-0ubuntu1')}
end

describe package('libkmod2:amd64') do
	it { should be_installed.with_version('15-0ubuntu6')}
end

describe package('libkrb5-26-heimdal:amd64') do
	it { should be_installed.with_version('1.6~git20131207+dfsg-1ubuntu1')}
end

describe package('libkrb5-3:amd64') do
	it { should be_installed.with_version('1.12+dfsg-2ubuntu4')}
end

describe package('libkrb5support0:amd64') do
	it { should be_installed.with_version('1.12+dfsg-2ubuntu4')}
end

describe package('liblcms2-2:amd64') do
	it { should be_installed.with_version('2.5-0ubuntu4')}
end

describe package('libldap-2.4-2:amd64') do
	it { should be_installed.with_version('2.4.31-1+nmu2ubuntu8')}
end

describe package('libldm-1.0-0') do
	it { should be_installed.with_version('0.2.3-2ubuntu1')}
end

describe package('libleveldb1:amd64') do
	it { should be_installed.with_version('1.15.0-2')}
end

describe package('liblist-moreutils-perl') do
	it { should be_installed.with_version('0.33-1build3')}
end

describe package('libllvm3.4:amd64') do
	it { should be_installed.with_version('1:3.4-1ubuntu3')}
end

describe package('liblocale-gettext-perl') do
	it { should be_installed.with_version('1.05-7build3')}
end

describe package('liblockfile-bin') do
	it { should be_installed.with_version('1.09-6ubuntu1')}
end

describe package('liblockfile1:amd64') do
	it { should be_installed.with_version('1.09-6ubuntu1')}
end

describe package('liblog-message-simple-perl') do
	it { should be_installed.with_version('0.10-1')}
end

describe package('liblwp-mediatypes-perl') do
	it { should be_installed.with_version('6.02-1')}
end

describe package('liblwp-protocol-https-perl') do
	it { should be_installed.with_version('6.04-2ubuntu0.1')}
end

describe package('liblwres90') do
	it { should be_installed.with_version('1:9.9.5.dfsg-3')}
end

describe package('liblzma5:amd64') do
	it { should be_installed.with_version('5.1.1alpha+20120614-2ubuntu2')}
end

describe package('liblzo2-2:amd64') do
	it { should be_installed.with_version('2.06-1.2ubuntu1.1')}
end	
 
describe package('libmagic1:amd64') do
	it { should be_installed.with_version('1:5.14-2ubuntu3.1')}
end

describe package('libmail-sendmail-perl') do
	it { should be_installed.with_version('0.79.16-1')}
end

describe package('libmailtools-perl') do
	it { should be_installed.with_version('2.12-1')}
end

describe package('libmnl0:amd64') do
	it { should be_installed.with_version('1.0.3-3ubuntu1')}
end

describe package('libmodule-pluggable-perl') do
	it { should be_installed.with_version('5.1-1')}
end

describe package('libmount1:amd64') do
	it { should be_installed.with_version('2.20.1-5.1ubuntu20.1')}
end

describe package('libmpc3:amd64') do
	it { should be_installed.with_version('1.0.1-1ubuntu1')}
end

describe package('libmpdec2:amd64') do
	it { should be_installed.with_version('2.4.0-6')}
end

describe package('libmpfr4:amd64') do
	it { should be_installed.with_version('3.1.2-1')}
end

describe package('libmysqlclient18:amd64') do
	it { should be_installed.with_version('5.5.38-0ubuntu0.14.04.1')}
end

describe package('libncurses5:amd64') do
	it { should be_installed.with_version('5.9+20140118-1ubuntu1')}
end

describe package('libncursesw5:amd64') do
	it { should be_installed.with_version('5.9+20140118-1ubuntu1')}
end

describe package('libnet-dns-perl') do
	it { should be_installed.with_version('0.68-1.2build1')}
end
describe package('libnet-domain-tld-perl') do
	it { should be_installed.with_version('1.70-1')}
end
describe package('libnet-http-perl') do
	it { should be_installed.with_version('6.06-1')}
end
describe package('libnet-ip-perl') do
	it { should be_installed.with_version('1.26-1')}
end
describe package('libnet-smtp-ssl-perl') do
	it { should be_installed.with_version('1.01-3')}
end
describe package('libnet-ssleay-perl') do
	it { should be_installed.with_version('1.58-1')}
end

describe package('libnetcf1') do
	it { should be_installed.with_version('1:0.2.3-4ubuntu1')}
end

describe package('libnetfilter-conntrack3:amd64') do
	it { should be_installed.with_version('1.0.4-1')}
end

describe package('libnetpbm10') do
	it { should be_installed.with_version('2:10.0-15ubuntu2')}
end

describe package('libnewt0.52:amd64') do
	it { should be_installed.with_version('0.52.15-2ubuntu5')}
end

describe package('libnfnetlink0:amd64') do
	it { should be_installed.with_version('1.0.1-2')}
end

describe package('libnih-dbus1:amd64') do
	it { should be_installed.with_version('1.0.3-4ubuntu25')}
end

describe package('libnih1:amd64') do
	it { should be_installed.with_version('1.0.3-4ubuntu25')}
end

describe package('libnl-3-200:amd64') do
	it { should be_installed.with_version('3.2.21-1')}
end

describe package('libnl-genl-3-200:amd64') do
	it { should be_installed.with_version('3.2.21-1')}
end

describe package('libnl-route-3-200:amd64') do
	it { should be_installed.with_version('3.2.21-1')}
end

describe package('libnspr4:amd64') do
	it { should be_installed.with_version('2:4.10.2-1ubuntu1.1')}
end

describe package('libnss3:amd64') do
	it { should be_installed.with_version('2:3.15.4-1ubuntu7')}
end

describe package('libnss3-nssdb') do
	it { should be_installed.with_version('2:3.15.4-1ubuntu7')}
end

describe package('libnuma1:amd64') do
	it { should be_installed.with_version('2.0.9~rc5-1ubuntu2')}
end

describe package('libogg0:amd64') do
	it { should be_installed.with_version('1.3.1-1ubuntu1')}
end

describe package('libopts25:amd64') do
	it { should be_installed.with_version('1:5.18-2ubuntu2')}
end

describe package('libp11-kit0:amd64') do
	it { should be_installed.with_version('0.20.2-2ubuntu2')}
end

describe package('libpam-cap:amd64') do
	it { should be_installed.with_version('1:2.24-0ubuntu2')}
end

describe package('libpam-modules:amd64') do
	it { should be_installed.with_version('1.1.8-1ubuntu2')}
end

describe package('libpam-modules-bin') do
	it { should be_installed.with_version('1.1.8-1ubuntu2')}
end

describe package('libpam-runtime') do
	it { should be_installed.with_version('1.1.8-1ubuntu2')}
end

describe package('libpam-systemd:amd64') do
	it { should be_installed.with_version('204-5ubuntu20.2')}
end

describe package('libpam0g:amd64') do
	it { should be_installed.with_version('1.1.8-1ubuntu2')}
end

describe package('libpaper-utils') do
	it { should be_installed.with_version('1.1.24+nmu2ubuntu3')}
end

describe package('libpaper1:amd64') do
	it { should be_installed.with_version('1.1.24+nmu2ubuntu3')}
end

describe package('libparse-debcontrol-perl') do
	it { should be_installed.with_version('2.005-4')}
end

describe package('libparse-debianchangelog-perl') do
	it { should be_installed.with_version('1.2.0-1ubuntu1')}
end

describe package('libparted0debian1:amd64') do
	it { should be_installed.with_version('2.3-19ubuntu1')}
end

describe package('libpcap0.8:amd64') do
	it { should be_installed.with_version('1.5.3-2')}
end

describe package('libpci3:amd64') do
	it { should be_installed.with_version('1:3.2.1-1ubuntu5')}
end

describe package('libpciaccess0:amd64') do
	it { should be_installed.with_version('0.13.2-1')}
end

describe package('libpcre3:amd64') do
	it { should be_installed.with_version('1:8.31-2ubuntu2')}
end

describe package('libperlio-gzip-perl') do
	it { should be_installed.with_version('0.18-1build3')}
end

describe package('libpipeline1:amd64') do
	it { should be_installed.with_version('1.3.0-1')}
end

describe package('libpixman-1-0:amd64') do
	it { should be_installed.with_version('0.30.2-2ubuntu1')}
end

describe package('libplymouth2:amd64') do
	it { should be_installed.with_version('0.8.8-0ubuntu17')}
end

describe package('libpng12-0:amd64') do
	it { should be_installed.with_version('1.2.50-1ubuntu2')}
end

describe package('libpod-latex-perl') do
	it { should be_installed.with_version('0.61-1')}
end

describe package('libpolkit-gobject-1-0:amd64') do
	it { should be_installed.with_version('0.105-4ubuntu2')}
end

describe package('libpopt0:amd64') do
	it { should be_installed.with_version('1.16-8ubuntu1')}
end

describe package('libprocps3:amd64') do
	it { should be_installed.with_version('1:3.3.9-1ubuntu2')}
end

describe package('libpulse0:amd64') do
	it { should be_installed.with_version('1:4.0-0ubuntu11')}
end

describe package('libpython-stdlib:amd64') do
	it { should be_installed.with_version('2.7.5-5ubuntu3')}
end

describe package('libpython2.7-minimal:amd64') do
	it { should be_installed.with_version('2.7.6-8')}
end

describe package('libpython2.7-stdlib:amd64') do
	it { should be_installed.with_version('2.7.6-8')}
end

describe package('libpython3-stdlib:amd64') do
	it { should be_installed.with_version('3.4.0-0ubuntu2')}
end

describe package('libpython3.4-minimal:amd64') do
	it { should be_installed.with_version('3.4.0-2ubuntu1')}
end

describe package('libpython3.4-stdlib:amd64') do
	it { should be_installed.with_version('3.4.0-2ubuntu1')}
end

describe package('libquadmath0:amd64') do
	it { should be_installed.with_version('4.8.2-19ubuntu1')}
end

describe package('librabbitmq1') do
	it { should be_installed.with_version('0.4.1-1')}
end

describe package('librados2') do
	it { should be_installed.with_version('0.80.1-0ubuntu1.1')}
end

describe package('librbd1') do
	it { should be_installed.with_version('0.80.1-0ubuntu1.1')}
end

describe package('libreadline5:amd64') do
	it { should be_installed.with_version('5.2+dfsg-2')}
end

describe package('libreadline6:amd64') do
	it { should be_installed.with_version('6.3-4ubuntu2')}
end

describe package('libroken18-heimdal:amd64') do
	it { should be_installed.with_version('1.6~git20131207+dfsg-1ubuntu1')}
end

describe package('librtmp0:amd64') do
	it { should be_installed.with_version('2.4+20121230.gitdf6c518-1')}
end

describe package('libsasl2-2:amd64') do
	it { should be_installed.with_version('2.1.25.dfsg1-17build1')}
end

describe package('libsasl2-modules:amd64') do
	it { should be_installed.with_version('2.1.25.dfsg1-17build1')}
end

describe package('libsasl2-modules-db:amd64') do
	it { should be_installed.with_version('2.1.25.dfsg1-17build1')}
end

describe package('libsdl1.2debian:amd64') do
	it { should be_installed.with_version('1.2.15-8ubuntu1.1')}
end

describe package('libseccomp2:amd64') do
	it { should be_installed.with_version('2.1.0+dfsg-1')}
end

describe package('libselinux1:amd64') do
	it { should be_installed.with_version('2.2.2-1ubuntu0.1')}
end

describe package('libsemanage-common') do
	it { should be_installed.with_version('2.2-1')}
end

describe package('libsemanage1:amd64') do
	it { should be_installed.with_version('2.2-1')}
end

describe package('libsepol1:amd64') do
	it { should be_installed.with_version('2.2-1')}
end

describe package('libsigc++-2.0-0c2a:amd64') do
	it { should be_installed.with_version('2.2.10-0.2ubuntu2')}
end

describe package('libsigsegv2:amd64') do
	it { should be_installed.with_version('2.10-2')}
end

describe package('libslang2:amd64') do
	it { should be_installed.with_version('2.2.4-15ubuntu1')}
end

describe package('libsmi2ldbl:amd64') do
	it { should be_installed.with_version('0.4.8+dfsg2-8ubuntu2')}
end

describe package('libsnappy1') do
	it { should be_installed.with_version('1.1.0-1ubuntu1')}
end

describe package('libsndfile1:amd64') do
	it { should be_installed.with_version('1.0.25-7ubuntu2')}
end

describe package('libsocket6-perl') do
	it { should be_installed.with_version('0.25-1')}
end

describe package('libspice-server1:amd64') do
	it { should be_installed.with_version('0.12.4-0nocelt2')}
end

describe package('libsqlite3-0:amd64') do
	it { should be_installed.with_version('3.8.2-1ubuntu2')}
end

describe package('libss2:amd64') do
	it { should be_installed.with_version('1.42.9-3ubuntu1')}
end

describe package('libssl1.0.0:amd64') do
	it { should be_installed.with_version('1.0.1f-1ubuntu2.4')}
end

describe package('libstdc++-4.8-dev:amd64') do
	it { should be_installed.with_version('4.8.2-19ubuntu1')}
end

describe package('libstdc++6:amd64') do
	it { should be_installed.with_version('4.8.2-19ubuntu1')}
end

describe package('libsub-identify-perl') do
	it { should be_installed.with_version('0.04-1build3')}
end

describe package('libsub-name-perl') do
	it { should be_installed.with_version('0.05-1build4')}
end

describe package('libsys-hostname-long-perl') do
	it { should be_installed.with_version('1.4-3')}
end

describe package('libsystemd-daemon0:amd64') do
	it { should be_installed.with_version('204-5ubuntu20.2')}
end


describe package('libsystemd-login0:amd64') do
	it { should be_installed.with_version('204-5ubuntu20.2')}
end

describe package('libtasn1-6:amd64') do
	it { should be_installed.with_version('3.4-3')}
end

describe package('libtcmalloc-minimal4') do
	it { should be_installed.with_version('2.1-2ubuntu1')}
end

describe package('libterm-ui-perl') do
	it { should be_installed.with_version('0.42-1')}
end

describe package('libtext-charwidth-perl') do
	it { should be_installed.with_version('0.04-7build3')}
end

describe package('libtext-iconv-perl') do
	it { should be_installed.with_version('1.7-5build2')}
end


describe package('libtext-levenshtein-perl') do
	it { should be_installed.with_version('0.06~01-2')}
end

describe package('libtext-soundex-perl') do
	it { should be_installed.with_version('3.4-1build1')}
end

describe package('libjs-underscore') do
	it { should be_installed.with_version('1.4.4-2ubuntu1')}
end

describe package('libjson-c2:amd64') do
	it { should be_installed.with_version('0.11-3ubuntu1.2')}
end

describe package('libjson-glib-1.0-0:amd64') do
	it { should be_installed.with_version('0.16.2-1ubuntu1')}
end

describe package('libjson-glib-1.0-common') do
	it { should be_installed.with_version('0.16.2-1ubuntu1')}
end

describe package('libtext-wrapi18n-perl') do
	it { should be_installed.with_version('0.06-7')}
end

describe package('libtie-ixhash-perl') do
	it { should be_installed.with_version('1.23-1')}
end

describe package('libtiff5:amd64') do
	it { should be_installed.with_version('4.0.3-7ubuntu0.1')}
end

describe package('libtimedate-perl') do
	it { should be_installed.with_version('2.3000-1')}
end

describe package('libtinfo5:amd64') do
	it { should be_installed.with_version('5.9+20140118-1ubuntu1')}
end

describe package('libtsan0:amd64') do
	it { should be_installed.with_version('4.8.2-19ubuntu1')}
end

describe package('libtxc-dxtn-s2tc0:amd64') do
	it { should be_installed.with_version('0~git20131104-1.1')}
end

describe package('libudev1:amd64') do
	it { should be_installed.with_version('204-5ubuntu20.2')}
end

describe package('libunistring0:amd64') do
	it { should be_installed.with_version('0.9.3-5ubuntu3')}
end

describe package('libunwind8') do
	it { should be_installed.with_version('1.1-2.2ubuntu3')}
end

describe package('liburi-perl') do
	it { should be_installed.with_version('1.60-1')}
end

describe package('libusb-0.1-4:amd64') do
	it { should be_installed.with_version('2:0.1.12-23.3ubuntu1')}
end

describe package('libusb-1.0-0:amd64') do
	it { should be_installed.with_version('2:1.0.17-1ubuntu2')}
end

describe package('libusbredirparser1:amd64') do
	it { should be_installed.with_version('0.6-2ubuntu1')}
end

describe package('libustr-1.0-1:amd64') do
	it { should be_installed.with_version('1.0.4-3ubuntu2')}
end

describe package('libuuid1:amd64') do
	it { should be_installed.with_version('2.20.1-5.1ubuntu20.1')}
end

describe package('libvirt-bin') do
	it { should be_installed.with_version('1.2.2-0ubuntu13.1.2')}
end

describe package('libvirt0') do
	it { should be_installed.with_version('1.2.2-0ubuntu13.1.2')}
end

describe package('libvorbis0a:amd64') do
	it { should be_installed.with_version('1.3.2-1.3ubuntu1')}
end

describe package('libvorbisenc2:amd64') do
	it { should be_installed.with_version('1.3.2-1.3ubuntu1')}
end

describe package('libwind0-heimdal:amd64') do
	it { should be_installed.with_version('1.6~git20131207+dfsg-1ubuntu1')}
end

describe package('libwrap0:amd64') do
	it { should be_installed.with_version('7.6.q-25')}
end

describe package('libwww-perl') do
	it { should be_installed.with_version('6.05-2')}
end

describe package('libwww-robotrules-perl') do
	it { should be_installed.with_version('6.01-1')}
end

describe package('libx11-6:amd64') do
	it { should be_installed.with_version('2:1.6.2-1ubuntu2')}
end

describe package('libx11-data') do
	it { should be_installed.with_version('2:1.6.2-1ubuntu2')}
end

describe package('libx11-xcb1:amd64') do
	it { should be_installed.with_version('2:1.6.2-1ubuntu2')}
end

describe package('libx86-1:amd64') do
	it { should be_installed.with_version('1.1+ds1-10')}
end

describe package('libxapian22') do
	it { should be_installed.with_version('1.2.16-2ubuntu1')}
end             

describe package('libxau6:amd64') do
	it { should be_installed.with_version('1:1.0.8-1')}
end   

describe package('libxcb-dri2-0:amd64') do
	it { should be_installed.with_version('1.10-2ubuntu1')}
end   

describe package('libxcb-dri3-0:amd64') do
	it { should be_installed.with_version('1.10-2ubuntu1')}
end   

describe package('libxcb-glx0:amd64') do
	it { should be_installed.with_version('1.10-2ubuntu1')}
end   

describe package('libxcb-present0:amd64') do
	it { should be_installed.with_version('1.10-2ubuntu1')}
end   

describe package('libxcb-sync1:amd64') do
	it { should be_installed.with_version('1.10-2ubuntu1')}
end   

describe package('libxcb1:amd64') do
	it { should be_installed.with_version('1.10-2ubuntu1')}
end   

describe package('libxdamage1:amd64') do
	it { should be_installed.with_version('1:1.1.4-1ubuntu1')}
end   

describe package('libxdmcp6:amd64') do
	it { should be_installed.with_version('1:1.1.1-1')}
end   

describe package('libxen-4.4') do
	it { should be_installed.with_version('4.4.0-0ubuntu5.1')}
end   

describe package('libxenstore3.0') do
	it { should be_installed.with_version('4.4.0-0ubuntu5.1')}
end   

describe package('libxext6:amd64') do
	it { should be_installed.with_version('2:1.3.2-1')}
end   

describe package('libxfixes3:amd64') do
	it { should be_installed.with_version('1:5.0.1-1ubuntu1')}
end   

describe package('libxml-parser-perl') do
	it { should be_installed.with_version('2.41-1build3')}
end   

describe package('libxml2:amd64') do
	it { should be_installed.with_version('2.9.1+dfsg1-3ubuntu4.3')}
end   

describe package('libxml2-utils') do
	it { should be_installed.with_version('2.9.1+dfsg1-3ubuntu4.3')}
end

describe package('libxmuu1:amd64') do
	it { should be_installed.with_version('2:1.1.1-1')}
end

describe package('libxshmfence1:amd64') do
	it { should be_installed.with_version('1.1-2')}
end

describe package('libxslt1.1:amd64') do
	it { should be_installed.with_version('1.1.28-2build1')}
end

describe package('libxtables10') do
	it { should be_installed.with_version('1.4.21-1ubuntu1')}
end

describe package('libxxf86vm1:amd64') do
	it { should be_installed.with_version('1:1.1.3-1')}
end

describe package('libyajl2:amd64') do
	it { should be_installed.with_version('2.0.4-4')}
end

describe package('libyaml-0-2:amd64') do
	it { should be_installed.with_version('0.1.4-3ubuntu3')}
end

describe package('lintian') do
	it { should be_installed.with_version('2.5.22ubuntu1')}
end

describe package('linux-firmware') do
	it { should be_installed.with_version('1.127.4')}
end

describe package('linux-generic') do
	it { should be_installed.with_version('3.13.0.30.36')}
end

describe package('linux-headers-generic') do
	it { should be_installed.with_version('3.13.0.30.36')}
end

describe package('linux-image-generic') do
	it { should be_installed.with_version('3.13.0.30.36')}
end

describe package('linux-libc-dev:amd64') do
	it { should be_installed.with_version('3.13.0-34.60')}
end

describe package('locales') do
	it { should be_installed.with_version('2.13+git20120306-12.1')}
end

describe package('lockfile-progs') do
	it { should be_installed.with_version('0.1.17')}
end

describe package('login') do
	it { should be_installed.with_version('1:4.1.5.1-1ubuntu9')}
end

describe package('logrotate') do
	it { should be_installed.with_version('3.8.7-1ubuntu1')}
end

describe package('lsb-base') do
	it { should be_installed.with_version('4.1+Debian11ubuntu6')}
end

describe package('lsb-release') do
	it { should be_installed.with_version('4.1+Debian11ubuntu6')}
end

describe package('lshw') do
	it { should be_installed.with_version('02.16-2ubuntu1')}
end

describe package('lsof') do
	it { should be_installed.with_version('4.86+dfsg-1ubuntu2')}
end

describe package('ltrace') do
	it { should be_installed.with_version('0.7.3-4ubuntu5.1')}
end

describe package('lvm2') do
	it { should be_installed.with_version('2.02.98-6ubuntu2')}
end

describe package('lxc-docker') do
	it { should be_installed.with_version('1.2.0')}
end

describe package('lxc-docker-1.2.0') do
	it { should be_installed.with_version('1.2.0')}
end

describe package('m4') do
	it { should be_installed.with_version('1.4.17-2ubuntu1')}
end

describe package('make') do
	it { should be_installed.with_version('3.81-8.2ubuntu3')}
end

describe package('makedev') do
	it { should be_installed.with_version('2.3.1-93ubuntu1')}
end

describe package('man-db') do
	it { should be_installed.with_version('2.6.7.1-1')}
end

describe package('manpages') do
	it { should be_installed.with_version('3.54-1ubuntu1')}
end

describe package('manpages-dev') do
	it { should be_installed.with_version('3.54-1ubuntu1')}
end

describe package('mawk') do
	it { should be_installed.with_version('1.3.3-17ubuntu2')}
end

describe package('mlocate') do
	it { should be_installed.with_version('0.26-1ubuntu1')}
end

describe package('module-init-tools') do
	it { should be_installed.with_version('15-0ubuntu6')}
end

describe package('mount') do
	it { should be_installed.with_version('2.20.1-5.1ubuntu20.1')}
end

describe package('mountall') do
	it { should be_installed.with_version('2.53')}
end

describe package('msr-tools') do
	it { should be_installed.with_version('1.3-2')}
end

describe package('mtr-tiny') do
	it { should be_installed.with_version('0.85-2')}
end

describe package('multiarch-support') do
	it { should be_installed.with_version('2.19-0ubuntu6')}
end


describe package('mysql-common') do
	it { should be_installed.with_version('5.5.38-0ubuntu0.14.04.1')}
end

describe package('nano') do
	it { should be_installed.with_version('2.2.6-1ubuntu1')}
end

describe package('ncurses-base') do
	it { should be_installed.with_version('5.9+20140118-1ubuntu1')}
end


describe package('ncurses-bin') do
	it { should be_installed.with_version('5.9+20140118-1ubuntu1')}
end

describe package('net-tools') do
	it { should be_installed.with_version('1.60-25ubuntu2')}
end

describe package('netbase') do
	it { should be_installed.with_version('5.2')}
end

describe package('netcat-openbsd') do
	it { should be_installed.with_version('1.105-7ubuntu1')}
end

describe package('netpbm') do
	it { should be_installed.with_version('2:10.0-15ubuntu2')}
end

describe package('nova-api-metadata') do
	it { should be_installed.with_version('1:2014.1.2-0ubuntu1.1')}
end

describe package('nova-common') do
	it { should be_installed.with_version('1:2014.1.2-0ubuntu1.1')}
end

describe package('nova-compute') do
	it { should be_installed.with_version('1:2014.1.2-0ubuntu1.1')}
end

describe package('nova-compute-kvm') do
	it { should be_installed.with_version('1:2014.1.2-0ubuntu1.1')}
end

describe package('nova-compute-libvirt') do
	it { should be_installed.with_version('1:2014.1.2-0ubuntu1.1')}
end

describe package('nova-network') do
	it { should be_installed.with_version('1:2014.1.2-0ubuntu1.1')}
end

describe package('ntfs-3g') do
	it { should be_installed.with_version('1:2013.1.13AR.1-2ubuntu2')}
end

describe package('ntp') do
	it { should be_installed.with_version('1:4.2.6.p5+dfsg-3ubuntu2')}
end

describe package('ntpdate') do
	it { should be_installed.with_version('1:4.2.6.p5+dfsg-3ubuntu2')}
end

describe package('open-iscsi') do
	it { should be_installed.with_version('2.0.873-3ubuntu9')}
end

describe package('openssh-client') do
	it { should be_installed.with_version('1:6.6p1-2ubuntu2')}
end

describe package('openssh-server') do
	it { should be_installed.with_version('1:6.6p1-2ubuntu2')}
end

describe package('openssh-sftp-server') do
	it { should be_installed.with_version('1:6.6p1-2ubuntu2')}
end


describe package('openssl') do
	it { should be_installed.with_version('1.0.1f-1ubuntu2.4')}
end

describe package('parted') do
	it { should be_installed.with_version('2.3-19ubuntu1')}
end

describe package('passwd') do
	it { should be_installed.with_version('1:4.1.5.1-1ubuntu9')}
end


describe package('patch') do
	it { should be_installed.with_version('2.7.1-4ubuntu1')}
end

describe package('patchutils') do
	it { should be_installed.with_version('0.3.2-3')}
end

describe package('pbuilder') do
	it { should be_installed.with_version('0.215ubuntu7')}
end

describe package('pciutils') do
	it { should be_installed.with_version('1:3.2.1-1ubuntu5')}
end


describe package('perl') do
	it { should be_installed.with_version('5.18.2-2ubuntu1')}
end

describe package('perl-base') do
	it { should be_installed.with_version('5.18.2-2ubuntu1')}
end

describe package('perl-modules') do
	it { should be_installed.with_version('5.18.2-2ubuntu1')}
end

describe package('plymouth') do
	it { should be_installed.with_version('0.8.8-0ubuntu17')}
end


describe package('plymouth-theme-ubuntu-text') do
	it { should be_installed.with_version('0.8.8-0ubuntu17') }
end

describe package('pm-utils') do
	it { should be_installed.with_version('1.4.1-13ubuntu0.1')}
end

describe package('po-debconf') do
	it { should be_installed.with_version('1.0.16+nmu2ubuntu1')}
end

describe package('poppler-data') do
	it { should be_installed.with_version('0.4.6-4')}
end


describe package('popularity-contest') do
	it { should be_installed.with_version('1.57ubuntu1')}
end

describe package('powermgmt-base') do
	it { should be_installed.with_version('1.31build1')}
end

describe package('ppp') do
	it { should be_installed.with_version('2.4.5-5.1ubuntu2')}
end

describe package('pppconfig') do
	it { should be_installed.with_version('2.3.19ubuntu1')}
end


describe package('pppoeconf') do
	it { should be_installed.with_version('1.20ubuntu1')}
end

describe package('procps') do
	it { should be_installed.with_version('1:3.3.9-1ubuntu2')}
end

describe package('psmisc') do
	it { should be_installed.with_version('22.20-1ubuntu2')}
end

describe package('python') do
	it { should be_installed.with_version('2.7.5-5ubuntu3')}
end


describe package('python-amqp') do
	it { should be_installed.with_version('1.3.3-1ubuntu1')}
end

describe package('python-amqplib') do
	it { should be_installed.with_version('1.0.2-1')}
end

describe package('python-anyjson') do
	it { should be_installed.with_version('0.3.3-1build1')}
end

describe package('python-apt') do
	it { should be_installed.with_version('0.9.3.5')}
end


describe package('python-apt-common') do
	it { should be_installed.with_version('0.9.3.5')}
end

describe package('python-babel') do
	it { should be_installed.with_version('1.3+dfsg.1-2ubuntu1')}
end

describe package('python-babel-localedata') do
	it { should be_installed.with_version('1.3+dfsg.1-2ubuntu1')}
end

describe package('python-blinker') do
	it { should be_installed.with_version('1.3.dfsg1-1ubuntu2')}
end

describe package('python-boto') do
	it { should be_installed.with_version('2.20.1-2ubuntu2')}
end

describe package('python-ceph') do
	it { should be_installed.with_version('0.80.1-0ubuntu1.1')}
end

describe package('python-chardet') do
	it { should be_installed.with_version('2.0.1-2build2')}
end

describe package('python-cinderclient') do
	it { should be_installed.with_version('1:1.0.8-0ubuntu1')}
end

describe package('python-cliff') do
	it { should be_installed.with_version('1.4.5-1ubuntu2')}
end

describe package('python-cliff-doc') do
	it { should be_installed.with_version('1.4.5-1ubuntu2')}
end

describe package('python-cmd2') do
	it { should be_installed.with_version('0.6.7-2fakesync1build1')}
end

describe package('python-colorama') do
	it { should be_installed.with_version('0.2.5-0.1ubuntu1')}
end

describe package('python-configobj') do
	it { should be_installed.with_version('4.7.2+ds-5build1')}
end

describe package('python-crypto') do
	it { should be_installed.with_version('2.6.1-4build1')}
end

describe package('python-decorator') do
	it { should be_installed.with_version('3.4.0-2build1')}
end

describe package('python-distlib') do
	it { should be_installed.with_version('0.1.8-1')}
end

describe package('python-dns') do
	it { should be_installed.with_version('2.3.6-3')}
end

describe package('python-dogpile.cache') do
	it { should be_installed.with_version('0.5.1-0ubuntu2')}
end

describe package('python-dogpile.core') do
	it { should be_installed.with_version('0.4.1-0ubuntu3')}
end

describe package('python-eventlet') do
	it { should be_installed.with_version('0.13.0-1ubuntu2')}
end

describe package('python-flask') do
	it { should be_installed.with_version('0.10.1-2build1')}
end

describe package('python-formencode') do
	it { should be_installed.with_version('1.2.6-1ubuntu1')}
end

describe package('python-glanceclient') do
	it { should be_installed.with_version('1:0.12.0-0ubuntu1')}
end

describe package('python-greenlet') do
	it { should be_installed.with_version('0.4.2-1build1')}
end

describe package('python-guestfs') do
	it { should be_installed.with_version('1:1.24.5-1')}
end

describe package('python-html5lib') do
	it { should be_installed.with_version('0.999-2')}
end

describe package('python-httplib2') do
	it { should be_installed.with_version('0.8-2build1')}
end

describe package('python-iso8601') do
	it { should be_installed.with_version('0.1.10-0ubuntu1')}
end

describe package('python-itsdangerous') do
	it { should be_installed.with_version('0.22+dfsg1-1build1')}
end

describe package('python-jinja2') do
	it { should be_installed.with_version('2.7.2-2')}
end

describe package('python-json-patch') do
	it { should be_installed.with_version('1.3-4')}
end

describe package('python-json-pointer') do
	it { should be_installed.with_version('1.0-2build1')}
end

describe package('python-jsonpatch') do
	it { should be_installed.with_version('1.3-4')}
end

describe package('python-jsonschema') do
	it { should be_installed.with_version('2.3.0-1build1')}
end

describe package('python-keystone') do
	it { should be_installed.with_version('1:2014.1.2.1-0ubuntu1.1')}
end

describe package('python-keystoneclient') do
	it { should be_installed.with_version('1:0.7.1-ubuntu1')}
end

describe package('python-kombu') do
	it { should be_installed.with_version('3.0.7-1ubuntu1')}
end

describe package('python-librabbitmq') do
	it { should be_installed.with_version('1.0.3-0ubuntu1')}
end

describe package('python-libvirt') do
	it { should be_installed.with_version('1.2.2-0ubuntu1')}
end

describe package('python-lockfile') do
	it { should be_installed.with_version('1:0.8-2ubuntu2')}
end

describe package('python-lxml') do
	it { should be_installed.with_version('3.3.3-1ubuntu0.1')}
end

describe package('python-m2crypto') do
	it { should be_installed.with_version('0.21.1-3ubuntu5')}
end

describe package('python-markupsafe') do
	it { should be_installed.with_version('0.18-1build2')}
end

describe package('python-migrate') do
	it { should be_installed.with_version('0.8.2-3ubuntu1')}
end

describe package('python-minimal') do
	it { should be_installed.with_version('2.7.5-5ubuntu3')}
end

describe package('python-mock') do
	it { should be_installed.with_version('1.0.1-3')}
end

describe package('python-mysqldb') do
	it { should be_installed.with_version('1.2.3-2ubuntu1')}
end

describe package('python-netaddr') do
	it { should be_installed.with_version('0.7.10-1build1')}
end

describe package('python-neutronclient') do
	it { should be_installed.with_version('1:2.3.4-0ubuntu1')}
end

describe package('python-nova') do
	it { should be_installed.with_version('1:2014.1.2-0ubuntu1.1')}
end

describe package('python-oauthlib') do
	it { should be_installed.with_version('0.6.1-1')}
end

describe package('python-openid') do
	it { should be_installed.with_version('2.2.5-3ubuntu1')}
end

describe package('python-openssl') do
	it { should be_installed.with_version('0.13-2ubuntu6')}
end

describe package('python-oslo.config') do
	it { should be_installed.with_version('1:1.2.1-0ubuntu2')}
end

describe package('python-oslo.messaging') do
	it { should be_installed.with_version('1.3.0-0ubuntu1')}
end

describe package('python-oslo.rootwrap') do
	it { should be_installed.with_version('1.2.0-0ubuntu1')}
end

describe package('python-pam') do
	it { should be_installed.with_version('0.4.2-13.1ubuntu3')}
end

describe package('python-paramiko') do
	it { should be_installed.with_version('1.10.1-1git1build1')}
end

describe package('python-passlib') do
	it { should be_installed.with_version('1.5.3-0ubuntu3')}
end

describe package('python-paste') do
	it { should be_installed.with_version('1.7.5.1-6ubuntu3')}
end

describe package('python-pastedeploy') do
	it { should be_installed.with_version('1.5.2-1')}
end

describe package('python-pastedeploy-tpl') do
	it { should be_installed.with_version('1.5.2-1')}
end

describe package('python-pastescript') do
	it { should be_installed.with_version('1.7.5-3build1')}
end

describe package('python-pbr') do
	it { should be_installed.with_version('0.7.0-0ubuntu2')}
end

describe package('python-pip') do
	it { should be_installed.with_version('1.5.4-1')}
end

describe package('python-pkg-resources') do
	it { should be_installed.with_version('3.3-1ubuntu1')}
end

describe package('python-prettytable') do
	it { should be_installed.with_version('0.7.2-2ubuntu2')}
end

describe package('python-pyasn1') do
	it { should be_installed.with_version('0.1.7-1ubuntu2')}
end

describe package('python-pycadf') do
	it { should be_installed.with_version('0.4.1-0ubuntu1.1')}
end

describe package('python-pycurl') do
	it { should be_installed.with_version('7.19.3-0ubuntu3')}
end

describe package('python-pyinotify') do
	it { should be_installed.with_version('0.9.4-1build1')}
end

describe package('python-pyparsing') do
	it { should be_installed.with_version('2.0.1+dfsg1-1build1')}
end

describe package('python-pysnmp4') do
	it { should be_installed.with_version('4.2.5-1')}
end

describe package('python-pysnmp4-apps') do
	it { should be_installed.with_version('0.3.2-1')}
end

describe package('python-pysnmp4-mibs') do
	it { should be_installed.with_version('0.1.3-1')}
end

describe package('python-repoze.lru') do
	it { should be_installed.with_version('0.6-4')}
end

describe package('python-requests') do
	it { should be_installed.with_version('2.2.1-1')}
end

describe package('python-routes') do
	it { should be_installed.with_version('2.0-1build1')}
end

describe package('python-scgi') do
	it { should be_installed.with_version('1.13-1.1build1')}
end

describe package('python-scour') do
	it { should be_installed.with_version('0.26-3build1')}
end

describe package('python-serial') do
	it { should be_installed.with_version('2.6-1build1')}
end

describe package('python-setuptools') do
	it { should be_installed.with_version('3.3-1ubuntu1')}
end

describe package('python-simplejson') do
	it { should be_installed.with_version('3.3.1-1ubuntu6')}
end

describe package('python-six') do
	it { should be_installed.with_version('1.5.2-1')}
end

describe package('python-software-properties') do
	it { should be_installed.with_version('0.92.37.1')}
end

describe package('python-sqlalchemy') do
	it { should be_installed.with_version('0.8.4-1build1')}
end

describe package('python-sqlalchemy-ext') do
	it { should be_installed.with_version('0.8.4-1build1')}
end

describe package('python-stevedore') do
	it { should be_installed.with_version('0.14.1-1')}
end

describe package('python-suds') do
	it { should be_installed.with_version('0.4.1-11ubuntu0.1')}
end

describe package('python-support') do
	it { should be_installed.with_version('1.0.15')}
end

describe package('python-tempita') do
	it { should be_installed.with_version('0.5.2-1build1')}
end

describe package('python-twisted') do
	it { should be_installed.with_version('13.2.0-1ubuntu1')}
end

describe package('python-twisted-bin') do
	it { should be_installed.with_version('13.2.0-1ubuntu1')}
end

describe package('python-twisted-conch') do
	it { should be_installed.with_version('1:13.2.0-1ubuntu1')}
end

describe package('python-twisted-core') do
	it { should be_installed.with_version('13.2.0-1ubuntu1')}
end

describe package('python-twisted-lore') do
	it { should be_installed.with_version('13.2.0-1ubuntu1')}
end

describe package('python-twisted-mail') do
	it { should be_installed.with_version('13.2.0-1ubuntu1')}
end

describe package('python-twisted-names') do
	it { should be_installed.with_version('13.2.0-1ubuntu1')}
end

describe package('python-twisted-news') do
	it { should be_installed.with_version('13.2.0-1ubuntu1')}
end

describe package('python-twisted-runner') do
	it { should be_installed.with_version('13.2.0-1ubuntu1')}
end

describe package('python-twisted-web') do
	it { should be_installed.with_version('13.2.0-1ubuntu1')}
end

describe package('python-twisted-words') do
	it { should be_installed.with_version('13.2.0-1ubuntu1')}
end

describe package('python-tz') do
	it { should be_installed.with_version('2012c-1build1')}
end

describe package('python-urllib3') do
	it { should be_installed.with_version('1.7.1-1build1')}
end

describe package('python-warlock') do
	it { should be_installed.with_version('1.1.0-0ubuntu2')}
end

describe package('python-webob') do
	it { should be_installed.with_version('1.3.1-1')}
end

describe package('python-werkzeug') do
	it { should be_installed.with_version('0.9.4+dfsg-1.1ubuntu1')}
end

describe package('python-yaml') do
	it { should be_installed.with_version('3.10-4build4')}
end

describe package('python-zope.interface') do
	it { should be_installed.with_version('4.0.5-1ubuntu4')}
end

describe package('python2.7') do
	it { should be_installed.with_version('2.7.6-8')}
end

describe package('python2.7-minimal') do
	it { should be_installed.with_version('2.7.6-8')}
end

describe package('python3') do
	it { should be_installed.with_version('3.4.0-0ubuntu2')}
end

describe package('python3-apt') do
	it { should be_installed.with_version('0.9.3.5')}
end

describe package('python3-chardet') do
	it { should be_installed.with_version('2.0.1-1')}
end

describe package('python3-commandnotfound') do
	it { should be_installed.with_version('0.3ubuntu12')}
end

describe package('python3-dbus') do
	it { should be_installed.with_version('1.2.0-2build2')}
end

describe package('python3-debian') do
	it { should be_installed.with_version('0.1.21+nmu2ubuntu2')}
end

describe package('python3-distupgrade') do
	it { should be_installed.with_version('1:0.220.2')}
end

describe package('python3-gdbm:amd64') do
	it { should be_installed.with_version('3.4.0-0ubuntu1')}
end

describe package('python3-gi') do
	it { should be_installed.with_version('3.12.0-1')}
end

describe package('python3-magic') do
	it { should be_installed.with_version('1:5.14-2ubuntu3.1')}
end

describe package('python3-minimal') do
	it { should be_installed.with_version('3.4.0-0ubuntu2')}
end

describe package('python3-pycurl') do
	it { should be_installed.with_version('7.19.3-0ubuntu3')}
end

describe package('python3-six') do
	it { should be_installed.with_version('1.5.2-1')}
end

describe package('python3-software-properties') do
	it { should be_installed.with_version('0.92.37.1')}
end

describe package('python3-update-manager') do
	it { should be_installed.with_version('1:0.196.12')}
end

describe package('python3.4') do
	it { should be_installed.with_version('3.4.0-2ubuntu1')}
end

describe package('python3.4-minimal') do
	it { should be_installed.with_version('3.4.0-2ubuntu1')}
end

describe package('qemu-keymaps') do
	it { should be_installed.with_version('2.0.0+dfsg-2ubuntu1.2') }
end

describe package('qemu-system') do
	it { should be_installed.with_version('2.0.0+dfsg-2ubuntu1.2')}
end

describe package('qemu-system-arm') do
	it { should be_installed.with_version('2.0.0+dfsg-2ubuntu1.2')}
end

describe package('qemu-system-common') do
	it { should be_installed.with_version('2.0.0+dfsg-2ubuntu1.2')}
end

describe package('qemu-system-mips') do
	it { should be_installed.with_version('2.0.0+dfsg-2ubuntu1.2')}
end

describe package('qemu-system-misc') do
	it { should be_installed.with_version('2.0.0+dfsg-2ubuntu1.2')}
end

describe package('qemu-system-ppc') do
	it { should be_installed.with_version('2.0.0+dfsg-2ubuntu1.2')}
end

describe package('qemu-system-sparc') do
	it { should be_installed.with_version('2.0.0+dfsg-2ubuntu1.2')}
end

describe package('qemu-system-x86') do
	it { should be_installed.with_version('2.0.0+dfsg-2ubuntu1.2')}
end

describe package('qemu-utils') do
	it { should be_installed.with_version('2.0.0+dfsg-2ubuntu1.2')}
end

describe package('readline-common') do
	it { should be_installed.with_version('6.3-4ubuntu2')}
end

describe package('reiserfsprogs') do
	it { should be_installed.with_version('1:3.6.24-1')}
end


describe package('resolvconf') do
	it { should be_installed.with_version('1.69ubuntu1.1')}
end

describe package('rsync') do
	it { should be_installed.with_version('3.1.0-2ubuntu0.1')}
end

describe package('rsyslog') do
	it { should be_installed.with_version('7.4.4-1ubuntu2')}
end

describe package('scrub') do
	it { should be_installed.with_version('2.5.2-2')}
end

describe package('seabios') do
	it { should be_installed.with_version('1.7.4-4')}
end

describe package('sed') do
	it { should be_installed.with_version('4.2.2-4ubuntu1')}
end


describe package('sensible-utils') do
	it { should be_installed.with_version('0.0.9')}
end

describe package('sgml-base') do
	it { should be_installed.with_version('1.26+nmu4ubuntu1')}
end

describe package('shared-mime-info') do
	it { should be_installed.with_version('1.2-0ubuntu3')}
end


describe package('sharutils') do
	it { should be_installed.with_version('1:4.14-1ubuntu1')}
end

describe package('smitools') do
	it { should be_installed.with_version('0.4.8+dfsg2-8ubuntu2')}
end

describe package('software-properties-common') do
	it { should be_installed.with_version('0.92.37.1')}
end

describe package('strace') do
	it { should be_installed.with_version('4.8-1ubuntu5')}
end

describe package('sudo') do
	it { should be_installed.with_version('1.8.9p5-1ubuntu1')}
end

describe package('supermin') do
	it { should be_installed.with_version('4.1.6-1')}
end

describe package('systemd-services') do
	it { should be_installed.with_version('204-5ubuntu20.2')}
end

describe package('systemd-shim') do
	it { should be_installed.with_version('6-2bzr1')}
end

describe package('sysv-rc') do
	it { should be_installed.with_version('2.88dsf-41ubuntu6')}
end

describe package('sysvinit-utils') do
	it { should be_installed.with_version('2.88dsf-41ubuntu6')}
end

describe package('t1utils') do
	it { should be_installed.with_version('1.37-2ubuntu1')}
end

describe package('tar') do
	it { should be_installed.with_version('1.27.1-1')}
end

describe package('tasksel') do
	it { should be_installed.with_version('2.88ubuntu15')}
end

describe package('tasksel-data') do
	it { should be_installed.with_version('2.88ubuntu15')}
end

describe package('tcpdump') do
	it { should be_installed.with_version('4.5.1-2ubuntu1')}
end

describe package('telnet') do
	it { should be_installed.with_version('0.17-36build2')}
end

describe package('time') do
	it { should be_installed.with_version('1.7-24')}
end

describe package('tzdata') do
	it { should be_installed.with_version('2014e-0ubuntu0.14.04')}
end


describe package('ubuntu-keyring') do
	it { should be_installed.with_version('2012.05.19')}
end

describe package('ubuntu-minimal') do
	it { should be_installed.with_version('1.325')}
end

describe package('ubuntu-release-upgrader-core') do
	it { should be_installed.with_version('1:0.220.2')}
end

describe package('ubuntu-standard') do
	it { should be_installed.with_version('1.325')}
end

describe package('ucf') do
	it { should be_installed.with_version('3.0027+nmu1')}
end

describe package('udev') do
	it { should be_installed.with_version('204-5ubuntu20.2')}
end

describe package('ufw') do
	it { should be_installed.with_version('0.34~rc-0ubuntu2')}
end

describe package('unattended-upgrades') do
	it { should be_installed.with_version('0.82.1ubuntu2')}
end

describe package('unzip') do
	it { should be_installed.with_version('6.0-9ubuntu1')}
end

describe package('update-manager-core') do
	it { should be_installed.with_version('1:0.196.12')}
end

describe package('upstart') do
	it { should be_installed.with_version('1.12.1-0ubuntu4')}
end

describe package('ureadahead') do
	it { should be_installed.with_version('0.100.0-16')}
end

describe package('usbutils') do
	it { should be_installed.with_version('1:007-2ubuntu1')}
end

describe package('util-linux') do
	it { should be_installed.with_version('2.20.1-5.1ubuntu20.1')}
end

describe package('uuid-runtime') do
	it { should be_installed.with_version('2.20.1-5.1ubuntu20.1')}
end

describe package('vbetool') do
	it { should be_installed.with_version('1.1-3')}
end

describe package('vim-common') do
	it { should be_installed.with_version('2:7.4.052-1ubuntu3')}
end

describe package('vim-tiny') do
	it { should be_installed.with_version('2:7.4.052-1ubuntu3')}
end

describe package('vlan') do
	it { should be_installed.with_version('1.9-3ubuntu10')}
end

describe package('watershed') do
	it { should be_installed.with_version('7')}
end

describe package('wdiff') do
	it { should be_installed.with_version('1.2.1-2')}
end

describe package('wget') do
	it { should be_installed.with_version('1.15-1ubuntu1')}
end

describe package('whiptail') do
	it { should be_installed.with_version('0.52.15-2ubuntu5')}
end

describe package('wireless-regdb') do
	it { should be_installed.with_version('2013.02.13-1ubuntu1') }
end

describe package('xauth') do
	it { should be_installed.with_version('1:1.0.7-1ubuntu1') }
end

describe package('xe-guest-utilities') do
	it { should be_installed.with_version('6.2.0-1120') }
end

describe package('xfsprogs') do
	it { should be_installed.with_version('3.1.9ubuntu2') }
end

describe package('xkb-data') do
	it { should be_installed.with_version('2.10.1-1ubuntu1') }
end

describe package('xml-core') do
	it { should be_installed.with_version('0.13+nmu2') }
end

describe package('xz-utils') do
	it { should be_installed.with_version('5.1.1alpha+20120614-2ubuntu2') }
end

describe package('zerofree') do
	it { should be_installed.with_version('1.0.2-1ubuntu1') }
end

describe package('zfs-fuse') do
	it { should be_installed.with_version('0.7.0-10.1') }
end

describe package('zlib1g:amd64') do
	it { should be_installed.with_version('1:1.2.8.dfsg-1ubuntu1') }
end

describe package('acpid') do
	it { should be_installed.with_version('1:2.0.21-1ubuntu2') }
end

describe package('apport') do
	it { should be_installed.with_version('2.14.1-0ubuntu3') }
end

describe package('apport-symptoms') do
	it { should be_installed.with_version('0.2') }
end

describe package('bc') do
	it { should be_installed.with_version('1.06.95-8ubuntu1') }
end

describe package('byobu') do
	it { should be_installed.with_version('5.77-0ubuntu1') }
end

describe package('fonts-ubuntu-font-family-console') do
	it { should be_installed.with_version('0.80-0ubuntu6') }
end

describe package('grub-common') do
	it { should be_installed.with_version('2.02~beta2-9') }
end

describe package('grub-gfxpayload-lists') do
	it { should be_installed.with_version('0.6') }
end

describe package('grub-pc') do
	it { should be_installed.with_version('2.02~beta2-9') }
end

describe package('grub-pc-bin') do
	it { should be_installed.with_version('2.02~beta2-9') }
end

describe package('grub2-common') do
	it { should be_installed.with_version('2.02~beta2-9') }
end

describe package('landscape-common') do
	it { should be_installed.with_version('14.01-0ubuntu3') }
end

describe package('laptop-detect') do
	it { should be_installed.with_version('0.13.7ubuntu2') }
end

describe package('libevent-2.0-5:amd64') do
	it { should be_installed.with_version('2.0.21-stable-1ubuntu1') }
end

describe package('libgc1c2:amd64') do
	it { should be_installed.with_version('1:7.2d-5ubuntu2') }
end

describe package('libgpm2:amd64') do
	it { should be_installed.with_version('1.20.4-6.1') }
end

describe package('libiw30:amd64') do
	it { should be_installed.with_version('30~pre9-8ubuntu1') }
end

describe package('linux-headers-3.13.0-24') do
	it { should be_installed.with_version('3.13.0-24.46') }
end

describe package('linux-headers-3.13.0-24-generic') do
	it { should be_installed.with_version('3.13.0-24.46') }
end

describe package('linux-image-3.13.0-24-generic') do
	it { should be_installed.with_version('3.13.0-24.46') }
end

describe package('linux-image-extra-3.13.0-24-generic') do
	it { should be_installed.with_version('3.13.0-24.46') }
end

describe package('mdadm') do
	it { should be_installed.with_version('3.2.5-5ubuntu4') }
end

describe package('memtest86+') do
	it { should be_installed.with_version('4.20-1.1ubuntu8') }
end

describe package('mime-support') do
	it { should be_installed.with_version('3.54ubuntu1') }
end

describe package('ncurses-term') do
	it { should be_installed.with_version('5.9+20140118-1ubuntu1') }
end

describe package('os-prober') do
	it { should be_installed.with_version('1.63ubuntu1') }
end

describe package('python-gdbm') do
	it { should be_installed.with_version('2.7.5-1ubuntu1') }
end

describe package('python-xapian') do
	it { should be_installed.with_version('1.2.16-2ubuntu1') }
end

describe package('python3-newt') do
	it { should be_installed.with_version('0.52.15-2ubuntu5') }
end

describe package('python3-problem-report') do
	it { should be_installed.with_version('2.14.1-0ubuntu3') }
end

describe package('run-one') do
	it { should be_installed.with_version('1.17-0ubuntu1') }
end

describe package('screen') do
	it { should be_installed.with_version('4.1.0~20120320gitdb59704-9') }
end

describe package('ssh-import-id') do
	it { should be_installed.with_version('3.21-0ubuntu1') }
end

describe package('tcpd') do
	it { should be_installed.with_version('7.6.q-25') }
end

describe package('tmux') do
	it { should be_installed.with_version('1.8-5') }
end

describe package('update-notifier-common') do
	it { should be_installed.with_version('0.154.1') }
end

describe package('vim') do
	it { should be_installed.with_version('2:7.4.052-1ubuntu3') }
end

describe package('vim-runtime') do
	it { should be_installed.with_version('2:7.4.052-1ubuntu3') }
end

describe package('w3m') do
	it { should be_installed.with_version('0.5.3-15') }
end

describe package('wireless-tools') do
	it { should be_installed.with_version('30~pre9-8ubuntu1') }
end

describe package('wpasupplicant') do
	it { should be_installed.with_version('2.1-0ubuntu1') }
end