CarrierWave.configure do |config|
  config.grid_fs_connection = Mongoid.database
end