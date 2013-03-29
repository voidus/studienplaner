desc "Annotate the models"
task :annotate => :environment do
  exec "bundle exec annotate --sort --model-dir models -e tests"
end
