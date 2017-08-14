# Extend the default assets:precompile by gzipping all assets once the default
# Sprockets behavior has completed. This is needed because Sprockets 2.x does
# not gzip static assets like SVGs, and Sprockets 3 no longer does gzipping at
# all!

namespace :assets do
  desc "Create .gz versions of assets"
  task gzip: :environment do
    Dir[Rails.root.join("public", "assets", "**", "*.{css,html,js,otf,svg,txt,xml}")].each do |file|
      mtime = File.mtime(file)
      gz_file = "#{file}.gz"

      next if File.exist?(gz_file) && File.mtime(gz_file) >= mtime

      Zlib::GzipWriter.open(gz_file, Zlib::BEST_COMPRESSION) do |gz|
        IO.copy_stream(File.open(file), gz)
      end

      File.utime(mtime, mtime, gz_file)
    end
  end

  # Hook into existing assets:precompile task
  Rake::Task["assets:precompile"].enhance do
    Rake::Task["assets:gzip"].invoke
  end
end
