require 'roo'

xls = Roo::Spreadsheet.open('FILENAME.xlsx')

xls.sheets.count.times do |t|
	xls.default_sheet = xls.sheets[t]
	sheet = xls.default_sheet.downcase
	file = Time.now.to_s.gsub(/[-:]/, " ").split(" ").map(&:strip).reject(&:empty?).join + "set_default_#{sheet}.rb"
	migrate = File.new("#{file}", "w")

	migrate.puts("class SetDefault#{xls.default_sheet} < ActiveRecord::Migration")
	migrate.puts("  def change")
	xls.last_column.times do |x|
		xls.cell(1,x+1).nil? ? migrate.puts("    add_column :#{sheet}, :blank") : migrate.puts("    add_column :#{sheet}, :#{xls.cell(1,x+1).gsub(/[ ]/, "_").downcase}")
	end
	migrate.puts("  end")
	migrate.puts("end")
end