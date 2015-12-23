class server{
	host {'localhost.localdomain':
		ensure => present,
		target => '/etc/hosts',
		ip => '127.0.0.1',
		host_aliases => 'localhost'
	}

	host {'dcserver.dicarte.com.br':
		ensure => present,
		target => '/etc/hosts',
		ip => '192.168.200.101',
		host_aliases => ['dcserver','puppet']
	}

	package{'puppetlabs-release-pc1':
		ensure => 'present',
		source => 'http://yum.puppetlabs.com/el/7/PC1/x86_64/puppetlabs-release-pc1-0.9.2-1.el7.noarch.rpm',
		require => Package['puppet']
	}

	package {'puppet':
		ensure => 'latest'
		
	}

	exec {'start-time-out-puppetservice':
		command => "echo 'START_TIMEOUT=999999999999999' >> /etc/sysconfig/puppetserver",
		path => '/usr/bin',
		before => Service['puppetserver'],
		require => Package['puppetserver']
	} 

	package {'puppetserver':
		ensure => '2.2.1-1.el7',
		require => Package['puppetlabs-release-pc1']
	}

	service{'puppetserver':
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => File['puppetserver.service']
	}	

	file {'puppetserver.service':
		ensure => file,
		path => '/usr/lib/systemd/system/puppetserver.service',
		content => template("server/puppetserver.service.erb"),	
		require => Package["puppetserver"]
	}

	exec{'iptables':
		command => 'iptables -F',
		path => '/usr/sbin'
	}
	
	file{'/etc/rc.d/rc.local':
		content => '#!/bin/bash\niptables -F\n',
		mode => '0770'
	}
	
}
