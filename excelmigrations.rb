require 'roo'

xls = Roo::Spreadsheet.open('FILENAME.xlsx')

xls.sheets.count.times do |t|
	xls.default_sheet = xls.sheets[t]
	sheet = xls.default_sheet.downcase
	ts = Time.now.to_s.gsub(/[-:]/, " ").split(" ").map(&:strip).reject(&:empty?)
	file = ts[0]+ts[1]+ts[2]+ts[3]+ts[4]+ts[5] + "_set_default_#{sheet}.rb"
	migrate = File.new("#{file}", "w")

	migrate.puts("class SetDefault#{xls.default_sheet} < ActiveRecord::Migration")
	migrate.puts("  def change")
	xls.last_column.times do |x|
		xls.cell(1,x+1).nil? ? migrate.puts("    add_column :#{sheet}, :blank") : migrate.puts("    add_column :#{sheet}, :#{xls.cell(1,x+1).gsub(/[ ]/, "_").downcase}, :string")
	end
	migrate.puts("  end")
	migrate.puts("end")

	$stdout.flush
	sleep(1)
end