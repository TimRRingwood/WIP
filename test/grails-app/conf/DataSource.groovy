dataSource {
	pooled = true
	driverClassName = "oracle.jdbc.driver.OracleDriver"
	username = "system"
	password = 'Hobo$001'
	dialect = "org.hibernate.dialect.OracleDialect"
	dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
	dialect = "org.hibernate.dialect.Oracle10gDialect"
	url = "jdbc:oracle:thin:@localhost:1521:orcl"
}

environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			dialect = "org.hibernate.dialect.Oracle10gDialect"
			url = "jdbc:oracle:thin:@localhost:1521:orcl"
		}
	}

test {
	dataSource {
		dbCreate = "validate" // one of 'create', 'create-drop', 'update', 'validate', ''
		dialect = "org.hibernate.dialect.Oracle10gDialect"
		url = "jdbc:oracle:thin:@localhost:1521:orcl"
	}
}

production {
	dataSource {
		dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
		dialect = "org.hibernate.dialect.Oracle10gDialect"
			url = "jdbc:oracle:thin:@localhost:1521:orcl"
	}
}
}
//dataSource {
//	pooled = true
//	dbCreate = ""
//	url = "jdbc:mysql://localhost/MySQL56"
//	driverClassName = "com.mysql.jdbc.Driver"
//	dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
//	username = "root"
//	password = "root"
//}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
	cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
	singleSession = true // configure OSIV singleSession mode
	flush.mode = 'manual' // OSIV session flush mode outside of transactional context
	jdbc.use_get_generated_keys = true
}
