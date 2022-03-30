class Database
    def initialize(host, user, database)
        @con = PG::Connection.new(host: host, user: user, dbname: database, port: '5432')
    end

    def query(q)
        @con.exec(q)
    end
end