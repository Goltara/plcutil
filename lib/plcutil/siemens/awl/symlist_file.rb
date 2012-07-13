require 'dbf' or raise 'Please install gem dbf to read symlist file'

module PlcUtil
  module Awl
		class SymlistFile
			def initialize(filename)
        @symlist = {}
        raise 'Specified symlist file not found' unless File.exists? filename
        table = DBF::Table.new filename
        table.each do |rec|
          next unless rec
          @symlist[rec.attributes['_skz']] = rec.attributes['_opiec']
        end
			end

      def [](tag)
        lookup tag
      end

      def lookup(tag)
        @symlist[tag]
      end
		end
  end
end


