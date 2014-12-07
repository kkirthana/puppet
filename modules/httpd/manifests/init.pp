class httpd {
	
	package {'httpd' :
		ensure => latest ,
		}
	
	vcsrepo { "/var/www/html":
  		ensure => present,
  		provider => git,
  		source => 'https://github.com/kkirthana/WebApp.git',
  		revision => 'master',
		notify => Service['httpd'],

		}
	
	service {'httpd' : 
		ensure => running ,
		enable => true,
		hasstatus => true,
		hasrestart => true ,
		require => Package['httpd'],	
	}

}
