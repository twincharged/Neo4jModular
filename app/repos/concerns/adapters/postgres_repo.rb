require 'rubygems'
require 'debugger'
require 'chassis'

class PostgresRepo < Chassis::BaseRepo

    class PostgresMap

      def initialize(sql)
        @sql = sql
      end


      def clear
      end


      def all(klass)
      end


      def get(klass, id)
      end


      def set(record)
      end

      def delete(record)
      end

    private

      def 
        @sql ||= Sql::Rest.new
      end
    end

  def initialize(sql)
    @map = PostgresMap.new(sql)
  end
end