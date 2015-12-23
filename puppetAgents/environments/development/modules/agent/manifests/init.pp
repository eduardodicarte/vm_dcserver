class agent {
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

	host {$fqdn:
		ensure => present,
		target => '/etc/hosts',
		ip => $ip,
		host_aliases => $hostname
	}

	package {'puppet':
		ensure => latest
	}

	service{'puppet':
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Package['puppet']
	}
}
