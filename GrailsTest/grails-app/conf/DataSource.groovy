dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "oracle.jdbc.OracleDriver"
    username = "stpt"
    password = "shstpt"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:oracle:thin:@10.1.48.13:1521:stptdemo"
        }
    }
//    test {
//        dataSource {
//            dbCreate = "update"
//            url = "jdbc:oracle:thin:@10.1.48.13:1521:stptdemo"
//        }
//    }
//    production {
//        dataSource {
//            dbCreate = "update"
//            url = "jdbc:oracle:thin:@10.1.48.13:1521:stptdemo"
//            properties {
//               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
//               jmxEnabled = true
//               initialSize = 5
//               maxActive = 50
//               minIdle = 5
//               maxIdle = 25
//               maxWait = 10000
//               maxAge = 10 * 60000
//               timeBetweenEvictionRunsMillis = 5000
//               minEvictableIdleTimeMillis = 60000
//               validationQuery = "SELECT 1"
//               validationQueryTimeout = 3
//               validationInterval = 15000
//               testOnBorrow = true
//               testWhileIdle = true
//               testOnReturn = false
//               jdbcInterceptors = "ConnectionState"
//               defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
//            }
//        }
//    }
}