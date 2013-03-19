desc "Import the modules from the latex sources"
task :import => [:environment, :'ar:create'] do
  Modul.delete_all

  module_dir = File.join(File.dirname(__FILE__), *%w[.. latex_sources module])
  Dir.foreach module_dir do |module_file|
    next if module_file == ".." or module_file == "."

    source = IO.read File.join(module_dir, module_file)
    Modul.from_latex(source).save
  end
end
